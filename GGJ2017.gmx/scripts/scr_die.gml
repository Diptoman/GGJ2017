if (obj_control._dead == false)
{
obj_control.alarm[4] = room_speed * 3;

for(i = 0; i < 50; i++)
{
    a = instance_create(obj_player1.x, obj_player1.y, obj_death);
    a.image_index = obj_player1.image_index;
    a = instance_create(obj_player2.x, obj_player2.y, obj_death);
    a.image_index = obj_player2.image_index;
}

obj_player1.visible = false;
obj_player2.visible = false;
obj_control._dead = true;

audio_play_sound(snd_die, 10, 0);
audio_play_sound(snd_shatter, 10, 0);

instance_create(x,y,obj_shake);
instance_create(x,y,obj_deathfade);
}
