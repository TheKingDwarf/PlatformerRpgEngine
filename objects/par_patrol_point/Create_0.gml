/// @description 

	if (!ds_exists(path, ds_type_list)) {
		with (obj_path_control)
		path_list[other.path] = ds_list_create()
		
	}
	var _id = obj_path_control.path_list[path];
	ds_list_add(_id,x);
	ds_list_add(_id,y);
	
