obstacle = argument0;
sideType = argument1;
sizeOfObstacle = argument2;

if (obstacle == obstacleType.Triangle)
{
    inst = instance_create(room_width + 96, room_height/2, obj_baseObstacle);
    inst._size = sizeOfObstacle;
}
