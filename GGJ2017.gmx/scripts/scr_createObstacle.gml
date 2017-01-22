obstacle = argument0;
sideType = argument1;
sizeOfObstacle = argument2;
var inst, shadInst;

if (obstacle == obstacleType.Normal)
{
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
}
