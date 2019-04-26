tool
extends Control


func _process(delta):
	if Engine.editor_hint:
			rect_position = Vector2(get_viewport_rect().size.x*0.9 - 3*$Panel.rect_size.x/4,
											 get_viewport_rect().size.y/2 - ($Panel.rect_size.y/2));
			rect_size = Vector2(300, 600);
			$Panel.rect_position = Vector2(0,0);
			$Panel.rect_size = rect_size;
			$Panel/Instructions_Text.rect_position = Vector2(0, 0);
			$Panel/Instructions_Text.rect_size = $Panel.rect_size
