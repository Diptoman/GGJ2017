//argument0 -> fileName
file = file_text_open_read(working_directory + "\" + argument0 + ".txt");
show_message(string(file));
var num = 0;
var timeStamp = 0, prevTimeStamp = 0;
var size = 1;
while (!file_text_eof(file))
{
    str[num] = file_text_readln(file);
    prevTimeStamp = timeStamp;
    
    //Get first comma
    pos = string_pos(",",str[num]);
    timeStamp = real(string_copy(str[num],0, pos - 1));

    //Replace
    str[num] = string_replace(str[num],string_copy(str[num],0,pos), "");
    
    //Get second comma
    pos = string_pos(",",str[num]);
    size = real(string_copy(str[num],0, pos - 1));
    
    scr_addToGenerator((timeStamp - prevTimeStamp) * room_speed, obstacleType.Triangle, obstacleSide.Both, size);
    num ++;
}
file_text_close(file);
