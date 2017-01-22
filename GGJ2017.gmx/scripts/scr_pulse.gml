if (x < room_width/2 && !_pulsated)
{
    var inst = instance_create(x,y,obj_pulse);
    inst._parent = id;
    
    if (sprite_index == spr_triangle1)
        inst.sprite_index = spr_pulse1;
    if (sprite_index == spr_triangle2)
        inst.sprite_index = spr_pulse2;
    if (sprite_index == spr_round1)
        inst.sprite_index = spr_pulse3;
    if (sprite_index == spr_round2)
        inst.sprite_index = spr_pulse4;
    if (sprite_index == spr_floating1)
        inst.sprite_index = spr_pulse5;
    if (sprite_index == spr_floating2)
        inst.sprite_index = spr_pulse6;
    
    
    _pulsated = true;
}
