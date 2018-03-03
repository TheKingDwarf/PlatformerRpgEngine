/// @description 
if (!instance_exists(obj_camera))instance_create_layer(x,y,"Instances",obj_camera);

global.FXlayer = layer_create(-1000);

var temp = layer_get_all();

for (var i= 0; i <array_length_1d(temp);i++) {

	var type = layer_get_element_type(temp[i])
	if (type == layerelementtype_background) ds_list_add(bg_layers,temp[i]);
}

