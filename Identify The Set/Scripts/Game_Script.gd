tool 
extends Control

var chosen = []; #chosen icons - list of dictionaries
var highlighter_chosen = []; #chosen highlighters to check if an highlighter was already chosen or not
var pressed_buttons = []; #array of all buttons that are pressed down
var curr_high; #current highlighter
var prev_high; #previous highlighter
var flag = false #flag for controlling eligible checks (so we dont always check)
var grid_size; #size of the game grid
var selfSettings = {};


#warning-ignore:unused_argument
func _process(delta):
	if Engine.editor_hint:
		rect_size = get_viewport_rect().size;
		rect_position = Vector2(0, 0);
		$Menu.rect_position = Vector2(0,0);
		$Background.rect_size = get_viewport_rect().size;
		$Background.rect_position = Vector2(0,0);
		$Highlighter_Container.rect_size = get_viewport_rect().size;
		$Highlighter_Container.rect_position = Vector2(0,0);

	
	else:
		if highlighter_chosen.size() == 3 and not flag:
			for c in $Grid.get_children():
				if c.is_pressed():
					pressed_buttons.append(c);

			flag = true;
			if check_eligible(pressed_buttons):
				for b in pressed_buttons.size():
					pressed_buttons[b].emit_signal("toggled", b)

				pressed_buttons.clear();

				for h in highlighter_chosen.size():
					highlighter_chosen[h].visible = false;

				highlighter_chosen.clear();

				flag = false;
				print("yay");

			else:
				for b in pressed_buttons.size():
					pressed_buttons[b].emit_signal("toggled", b)

				pressed_buttons.clear();
				
				for h in highlighter_chosen.size():
					highlighter_chosen[h].visible = false;

				highlighter_chosen.clear();

				flag = false;
				print("nay");


func start_game(size):
	grid_size = size;
	initialize_grid(size)

	if selfSettings.has("hints"):
		if selfSettings["hints"]:
			$Hints.show();

func initialize_grid(size):
	var button_size = 128;
	$Grid.columns = size.y
	$Grid.rect_size = Vector2(button_size*size.y, button_size*size.x);
	$Grid.rect_position = get_viewport_rect().size / 2 - $Grid.rect_size / 2;
	
#warning-ignore:unused_variable
	for i in range(3):
		var highlighter = ColorRect.new();
		highlighter.color = Color("#32ffffff");
		highlighter.rect_size = Vector2(button_size, button_size);
		highlighter.mouse_filter = Control.MOUSE_FILTER_IGNORE;
		highlighter.connect("mouse_entered", self, "_on_entered_high", [highlighter]);
		$Highlighter_Container.add_child(highlighter);
		highlighter.visible = false;

#warning-ignore:unused_variable
	for i in range(size.x*size.y):
		var button = TextureButton.new();
		button.rect_size = Vector2(button_size, button_size);
		button.toggle_mode = true;
		button.expand = true;
		button.size_flags_horizontal = TextureButton.SIZE_EXPAND_FILL;
		button.size_flags_vertical = TextureButton.SIZE_EXPAND_FILL;
		button.set_anchors_and_margins_preset(Control.PRESET_CENTER);
		button.set_meta("attribs", rand_icon());
		button.texture_normal = button.get_meta("attribs")["image"];
		button.connect("toggled", self, "button_toggeled", [button]);
		$Grid.add_child(button);
		
	ensure_eligible_exists($Grid.get_children());


func check_eligible(set):
	var flag = false;
	var	button1attribs = set[0].get_meta("attribs");
	var button2attribs = set[1].get_meta("attribs");
	var button3attribs = set[2].get_meta("attribs");

	for i in button1attribs:
		for j in button2attribs:
			for k in button3attribs:
				if i == "image" or j == "image" or k == "image":
					continue;

				else:
					if button1attribs.get(i) == button2attribs.get(j) and button1attribs.get(i) == button3attribs.get(k):
						flag = false;
					elif button1attribs.get(i) != button2attribs.get(j) and button1attribs.get(i) != button3attribs.get(k) and button2attribs.get(j) != button3attribs.get(k):
						flag = false
					else:
						flag = true;
						break;

				if flag == true:
					break;

			if flag == true:
				break;

		if flag == true:
			break;

	if flag == true:
		return;

	else:
		return true;
	

func rand_icon():
	randomize();
	var attribs = Globals.icons.values(); #get all values of all keys in icons dictionary
	attribs = attribs[randi() % attribs.size()]; #choose a random value

	if chosen.has(attribs):
		attribs = rand_icon()

	else:
		chosen.append(attribs);

	return attribs; #return attribute dictionary


func button_toggeled(state, button):
	if  pressed_buttons.size() < 3:
		if state == false:
			if curr_high == null:
				prev_high.hide();
				highlighter_chosen.erase(prev_high);
			else:
				curr_high.hide()
				highlighter_chosen.erase(curr_high);
				curr_high = null;

		else:
				prev_high = curr_high;
				curr_high = get_highlight();
				if curr_high != null:
					curr_high.rect_global_position = button.rect_global_position;
					curr_high.show();
	else:
		button.set_pressed(!button.is_pressed());


func get_highlight():
	if highlighter_chosen.size() >= 3:
		$Error.show();
		$Error/Timer.start();
		return;
	
	var chosen_high = $Highlighter_Container.get_children()[randi() % 3];
	
	if highlighter_chosen.has(chosen_high):
		chosen_high = get_highlight();
	
	else:
		highlighter_chosen.append(chosen_high);
	
	return chosen_high;


func ensure_eligible_exists(buttons):
	var flag = false;
	for i in buttons.size():
		for j in buttons.size() - 1:
			for k in buttons.size() - 2:
				if check_eligible([buttons[i], buttons[j], buttons[k]]):
					return true;
	
	flag = true;
	if flag == true:
		start_game(grid_size);
		return;


func _on_Timer_timeout():
	$Error.hide();

func _on_entered_high(high):
	if highlighter_chosen.size >= 3 and highlighter_chosen.has(high):
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			high.hide();

func recieve_settings(settings):
	selfSettings = settings;
	$Settings.hide();
	$Menu.show();
	
func show_settings():
	$Settings.show();
