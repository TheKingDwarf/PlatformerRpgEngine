/// @description 
if (!instance_exists(obj_camera))instance_create_layer(x,y,"Instances",obj_camera);

global.FXlayer = layer_create(-1000);


//generate navmesh for enemy type
tilemap = generate_tilemap(16);
