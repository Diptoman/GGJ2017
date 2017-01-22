#define scr_setGenerator
//Argument0 -> Map to read from
//Argument1 -> Audio to play
_pos = 0;
_currentWidth = 1;
_currentMap = argument0;
audio_play_sound(argument1, 10, 1);
//Set tempo
_levelModifier = 3 + ds_grid_get(_currentMap, 0, 0);
//Set first time
alarm[1] = ds_grid_get(_currentMap, _currentWidth, 0);

#define scr_addToGenerator
var generatorMap = argument0;
var timeStamp = argument1;
var typeOfObstacle = argument2;
var sideType = argument3;
var size = argument4;

ds_grid_add(generatorMap, _pos, 0, timeStamp);
ds_grid_add(generatorMap, _pos, 1, typeOfObstacle);
ds_grid_add(generatorMap, _pos, 2, sideType);
ds_grid_add(generatorMap, _pos, 3, size);

_pos += 1;

#define scr_createGenerator
_pos = 0;
_currentWidth = 0;
var generatorMap = ds_grid_create(10000, 4);
return generatorMap;

#define scr_addTempoDataToGenerator
var generatorMap = argument0;
var tempo = argument1;

ds_grid_add(generatorMap, 0, 0, tempo);

_pos+=1;
