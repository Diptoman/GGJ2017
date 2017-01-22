//argument0 -> fileName
//Argument1 -> GeneratorMap
file = file_text_open_read(working_directory + "\" + argument0 + ".txt");
var num = 0;
var timeStamp = 0, prevTimeStamp = 0, actualTimeStamp = 0, finalTimeStamp;
var size = 1;
var obsType = 0, realObsType = obstacleType.Normal;
var obsSide = 0, realObsSide = obstacleSide.BothDown;
var sdType = obstacleSide.BothDown;

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
    
    //Replace
    str[num] = string_replace(str[num],string_copy(str[num],0,pos), "");
    
    //Get third comma (obstacleType)
    pos = string_pos(",",str[num]);
    obsType = real(string_copy(str[num],0, pos - 1));
    
    switch(obsType)
    {
        case 0:
            realObsType = obstacleType.Switcher;
            break;
            
        case 1:
            realObsType = obstacleType.Normal;
            break;
            
        case 2:
            realObsType = obstacleType.Floating;
            break;
    }
    
    //Replace
    str[num] = string_replace(str[num],string_copy(str[num],0,pos), "");
    
    //Get fourth comma (obstacleSide)
    pos = string_pos(",",str[num]);
    obsSide = real(string_copy(str[num],0, pos - 1));
    
    switch(obsSide)
    {
        case 0:
            realObsSide = obstacleSide.BothUp;
            break;
            
        case 1:
            realObsSide = obstacleSide.BothDown;
            break;
            
        case 2:
            realObsSide = obstacleSide.TopUp;
            break;
            
        case 3:
            realObsSide = obstacleSide.TopDown;
            break;
            
        case 4:
            realObsSide = obstacleSide.BottomUp;
            break;
            
        case 5:
            realObsSide = obstacleSide.BottomDown;
            break;
    }
    
    //Set actual times
    actualTimeStamp = timeStamp - ((room_width/2)/(obj_control._baseSpeed * obj_control._levelModifier * room_speed));
    
    if ((actualTimeStamp - prevTimeStamp) < 0)
        finalTimeStamp = 0.01;    
    else
        finalTimeStamp = actualTimeStamp - prevTimeStamp; 
        
    
    scr_addToGenerator(argument1, finalTimeStamp * room_speed, realObsType, realObsSide, size);
    num ++;
}
file_text_close(file);
