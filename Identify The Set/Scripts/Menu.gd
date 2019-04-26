tool
extends Control

var size = Vector2(3, 3);
signal game_started()
signal settings_entered()
signal send_grid_size();

func _ready():
	if not is_connected("game_started", get_parent(), "start_game"):
		connect("game_started", get_parent(), "start_game");
		
	if not is_connected("settings_entered", get_parent(), "show_settings"):
		connect("settings_entered", get_parent(), "show_settings");
	
	if not is_connected("send_grid_size", get_parent().get_node("Hints"), "recieve_grid_size"):
		connect("send_grid_size", get_parent().get_node("Hints"), "recieve_grid_size");
		
	$Grid_Select.clear()
	for i in range(3, 5):
		for j in range(3, 5):
			$Grid_Select.add_item(str(i) + "x" + str(j));



func _process(delta):
	if Engine.editor_hint:
		rect_position = Vector2(0, 0);
		rect_size = get_viewport_rect().size;
		$Start.rect_position = get_viewport_rect().size / Vector2(6, 2) - $Start.rect_size/2;
		$Title.rect_position = get_viewport_rect().size / Vector2(2, 8) - $Title.rect_size/2;
		$Grid_Select.rect_position = get_viewport_rect().size * Vector2(0.16666666667, 0.6) - $Grid_Select.rect_size/2;
		$Grid_Error.rect_position = get_viewport_rect().size / Vector2(2, 3) - $Grid_Error.rect_size/2;
		$SettingsButton.rect_global_position = Vector2(get_viewport_rect().size.x / 2 - $SettingsButton.rect_size.x / 2, get_viewport_rect().size.y * 0.82)


func _on_Start_pressed():
	if size != null:
		hide();
		emit_signal("game_started", size);

	else:
		$Grid_Error.visible = true;
		$Grid_Error/Timer.start();



func _on_Grid_Select_item_selected(ID):
	match ID:
		0: size = Vector2(3, 3);
		1: size = Vector2(3, 4);
		2: size = Vector2(4, 3);
		3: size = Vector2(4, 4);


func _on_Timer_timeout():
	$Grid_Error.visible = false;

func _on_SettingsButton_pressed():
	emit_signal("settings_entered")
	emit_signal("send_grid_size", size);
	hide();
