tool
extends Control

var grid_size = Vector2(1, 1);
var flag = false;


func _process(delta):
	if Engine.editor_hint:
			rect_size = get_viewport_rect().size;
			rect_position = Vector2(0, 0);

	else:
		if not flag:
			$Panel_right.rect_size = Vector2(grid_size.x*384/1.7, grid_size.y*384*1.5); 
			$Panel_right.rect_position = Vector2(rect_size.x - $Panel_right.rect_size.x, 100); 
			$Panel_left.rect_size = Vector2(grid_size.x*384/1.7, grid_size.y*384*1.5); 
			$Panel_left.rect_position = Vector2(0, 100); 
			flag = true;

func recieve_grid_size(size):
	grid_size = size;