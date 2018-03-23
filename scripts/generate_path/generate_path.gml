///generate_path(targetX,targetY,navmesh)
///@description makes a path between two points given a navmesh
///@param targetX
///@param targetY
///@param navmesh
gml_pragma("forceinline");	// add this here, because we want this script running really quickly
							//and compiling inline helps the performance slightly
var targetX = argument0;
var targetY = argument1;
var navmesh = argument2;

