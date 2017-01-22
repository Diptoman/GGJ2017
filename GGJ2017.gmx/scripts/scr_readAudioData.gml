//argument0 -> fileName
//Argument1 -> GeneratorMap
file = file_text_open_read(working_directory + "\" + argument0 + ".txt");
var num = 0;
var timeStamp = 0, prevTimeStamp = 0, actualTimeStamp = 0, finalTimeStamp;
var size = 1;

var tempo = file_text_readln(file);
scr_addTempoDataToGenerator(argument1, real(tempo));

while (!file_text_eof(file))
{
    str[num] = file_text_readln(file);
    prevTimeStamp = actualTimeStamp;
    
    //Get first comma (timestamp)
    pos = string_pos(",",str[num]);
    timeStamp = real(string_copy(str[num],0, pos - 1));

    //Replace
    str[num] = string_replace(str[num],string_copy(str[num],0,pos), "");
    
    //Get second comma (size)
    pos = string_pos(",",str[num]);
    size = real(string_copy(str[num],0, pos - 1));
    
    actualTimeStamp = timeStamp - ((room_width/2)/(obj_control._baseSpeed * obj_control._levelModifier * room_speed));
    
    if ((actualTimeStamp - prevTimeStamp) < 0)
        finalTimeStamp = 0.01;    
    else
        finalTimeStamp = actualTimeStamp - prevTimeStamp;        
    
    scr_addToGenerator(argument1, finalTimeStamp * room_speed, obstacleType.Triangle, obstacleSide.Both, size);
    num ++;
}
file_text_close(file);
