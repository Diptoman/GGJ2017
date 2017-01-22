#define scr_createObstacle
var obstacle = argument0;
var sideType = argument1;
var sizeOfObstacle = argument2;

if (obstacle == obstacleType.Normal)
{
    scr_createNormalObstacle(sideType, sizeOfObstacle);
}
else if (obstacle == obstacleType.Switcher)
{
    scr_createSwitcher(sideType, sizeOfObstacle);
}

#define scr_createNormalObstacle
var inst, shadInst;
var sideType = argument0;
var sizeOfObstacle = argument1;

    //DOWN
    //Top obstacle
    if ((sideType == obstacleSide.TopDown) || (sideType == obstacleSide.BothDown))
    {    
        inst1 = instance_create(room_width, room_height/2, obj_baseObstacle);
        inst1._size = sizeOfObstacle;
        inst1.sprite_index = choose(spr_triangle1, spr_triangle2, spr_triangle3, spr_round1, spr_round2);
    }
    //Bottom shadow
    if (sideType == obstacleSide.TopDown)
    {
        shadInst = instance_create(room_width, room_height/2, obj_baseObstacleShadow);
        shadInst._size = sizeOfObstacle;
        shadInst.sprite_index = inst1.sprite_index;
        shadInst._yDir = -1;
    }
    //Bottom obstacle
    if ((sideType == obstacleSide.BottomDown) || (sideType == obstacleSide.BothDown))
    {    
        inst2 = instance_create(room_width, room_height/2, obj_baseObstacle);
        inst2._size = sizeOfObstacle;
        if (sideType == obstacleSide.BothDown)
            inst2.sprite_index = inst1.sprite_index;
        else
            inst2.sprite_index = choose(spr_triangle1, spr_triangle2, spr_triangle3, spr_round1, spr_round2);
        inst2._yDir = -1;
    }
    //Top shadow
    if (sideType == obstacleSide.BottomDown)
    {
        shadInst = instance_create(room_width, room_height/2, obj_baseObstacleShadow);
        shadInst._size = sizeOfObstacle;
        shadInst.sprite_index = inst2.sprite_index;
    }
    
    //UP
    //Top obstacle
    if ((sideType == obstacleSide.TopUp) || (sideType == obstacleSide.BothUp))
    {    
        inst1 = instance_create(room_width, 0, obj_baseObstacle);
        inst1._size = sizeOfObstacle;
        inst1.sprite_index = choose(spr_triangle1, spr_triangle2, spr_triangle3, spr_round1, spr_round2);
        inst1._yDir = -1;
    }
    //Bottom shadow
    if (sideType == obstacleSide.TopUp)
    {
        shadInst = instance_create(room_width, room_height, obj_baseObstacleShadow);
        shadInst._size = sizeOfObstacle;
        shadInst.sprite_index = inst1.sprite_index;
    }
    //Bottom obstacle
    if ((sideType == obstacleSide.BottomUp) || (sideType == obstacleSide.BothUp))
    {    
        inst2 = instance_create(room_width, room_height, obj_baseObstacle);
        inst2._size = sizeOfObstacle;
        if (sideType == obstacleSide.BothUp)
            inst2.sprite_index = inst1.sprite_index;
        else
            inst2.sprite_index = choose(spr_triangle1, spr_triangle2, spr_triangle3, spr_round1, spr_round2);
    }
    //Top shadow
    if (sideType == obstacleSide.BottomUp)
    {
        shadInst = instance_create(room_width, 0, obj_baseObstacleShadow);
        shadInst._size = sizeOfObstacle;
        shadInst.sprite_index = inst2.sprite_index;
        shadInst._yDir = -1;
    }

#define scr_createSwitcher
var inst, shadInst;
var sideType = argument0;
var sizeOfObstacle = argument1;

instance_create(room_width + 96, room_height/2 - 180, obj_switcharea);
instance_create(room_width + 96, room_height/2 + 180, obj_switcharea);

