tool
extends Control

var settings = {"audio": false,
				"hints": false
				};

func _ready():
	if not $Exit.is_connected("pressed", get_parent(), "recieve_settings"):
		$Exit.connect("pressed", get_parent(), "recieve_settings", [settings]);

func _process(delta):
	if Engine.editor_hint:
		rect_size = get_viewport_rect().size;
		rect_position = Vector2(0, 0);
		$Title.rect_position = Vector2(rect_size.x / 2 - $Title.rect_size.x / 2, 5);
		$AudioButton.rect_position = Vector2(rect_size.x / 2 - $AudioButton.rect_size.x / 2, rect_size.y / 8);
		$HintsButton.rect_position = Vector2(rect_size.x / 2 - $HintsButton.rect_size.x / 2, rect_size.y / 8 + $HintsButton.rect_size.y * 2);
		$Exit.rect_position = Vector2(rect_size.x / 2 - $Exit.rect_size.x / 2, rect_size.y * 0.8);
		
	else: 
		if $HintsButton.pressed:
			settings["hints"] = true;
		else:
			settings["hints"] = false;
		
		if $AudioButton.pressed:
			settings["audio"] = true;
		else:
			settings["audio"] = false;

