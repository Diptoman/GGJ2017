//Move based on player slot

image_xscale = 2;
image_yscale = 2;

var playerSlot = argument0;
image_index = playerSlot - 1;

y += _yspd;

if (y < 0) || (y > room_height)
{
    scr_die();
}

if (instance_position(x, y, obj_switchzone))
{
    if (inputdog_pressed("Select", playerSlot))
    {
        _canSwitch = true;
    }
}
else
{
    _canSwitch = false;
}


if (_canControl)
{
if (_type == 1)
{
    if (inputdog_down("Change", playerSlot))
    {
        _yspd = obj_control._baseSpeed * 4 * obj_control._timeScale;// * obj_control._levelModifier;
    }
    else
    {
        if (y >= room_height/2 + 48)
            _yspd = -obj_control._baseSpeed * 4 * obj_control._timeScale; // * obj_control._levelModifier;
        else
            _yspd = 0;
    }
}
else
{
    if (inputdog_down("Change", playerSlot))
    {
        _yspd = - obj_control._baseSpeed * 4 * obj_control._timeScale;// * obj_control._levelModifier;
    }
    else
    {
        if (y <= room_height/2 - 48)
            _yspd = obj_control._baseSpeed * 4 * obj_control._timeScale;// * obj_control._levelModifier;
        else
            _yspd = 0;
    }
}

if (inputdog_pressed("Change", playerSlot))
{
    _blocked = true;
    alarm[0] = sign(_yspd) * _yspd / 3;
}
else if (inputdog_released("Change", playerSlot))
{
    _blocked = true;
    alarm[0] = sign(_yspd) * _yspd / 3;
}
}

//if (!_blocked)
{
    inst = instance_create(x, y, obj_trail);
    inst._angle = sign(_yspd) * -45;
    inst.playerSlot = playerSlot;
}
