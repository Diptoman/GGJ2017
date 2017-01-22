//Argument 0/1/2 -> File names
//Argument 3/4/5 -> Sound files 

_mapBgmFast = scr_createGenerator();
scr_readAudioData(argument2, _mapBgmFast);
_mapBgmSlow = scr_createGenerator();
scr_readAudioData(argument0, _mapBgmSlow);
_mapBgmMedium = scr_createGenerator();
scr_readAudioData(argument1, _mapBgmMedium);

_order = ds_grid_create(5,3);
ds_grid_add(_order, 0, 0, _mapBgmSlow);
ds_grid_add(_order, 0, 1, argument3);
ds_grid_add(_order, 0, 2, audio_sound_length(argument3));

ds_grid_add(_order, 1, 0, _mapBgmMedium);
ds_grid_add(_order, 1, 1, argument4);
ds_grid_add(_order, 1, 2, audio_sound_length(argument4));

ds_grid_add(_order, 2, 0, _mapBgmMedium);
ds_grid_add(_order, 2, 1, argument4);
ds_grid_add(_order, 2, 2, audio_sound_length(argument4));

ds_grid_add(_order, 3, 0, _mapBgmFast);
ds_grid_add(_order, 3, 1, argument5);
ds_grid_add(_order, 3, 2, audio_sound_length(argument5));

ds_grid_add(_order, 4, 0, _mapBgmFast);
ds_grid_add(_order, 4, 1, argument5);
ds_grid_add(_order, 4, 2, audio_sound_length(argument5));

//Set
_currentAudioGridPos = 0;

scr_setGenerator();
