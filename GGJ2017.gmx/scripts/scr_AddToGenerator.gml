#define scr_addToGenerator
timeStamp = argument0;
typeOfObstacle = argument1;
sideType = argument2;
size = argument3;

ds_grid_add(_generatorMap, _pos, 0, timeStamp);
ds_grid_add(_generatorMap, _pos, 1, typeOfObstacle);
ds_grid_add(_generatorMap, _pos, 2, sideType);
ds_grid_add(_generatorMap, _pos, 3, size);

_pos += 1;

#define scr_resetGenerator
_pos = 0;
_currentWidth = 0;
ds_grid_destroy(_generatorMap);
_generatorMap = ds_grid_create(10000, 4);

#define scr_setGenerator
_pos = 0;
_currentWidth = 0;
_generatorMap = ds_grid_create(10000, 4);
