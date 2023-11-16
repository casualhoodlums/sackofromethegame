extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		show_pause_menu()
		
	if Input.is_action_just_pressed("console"):
		toggle_dev_menu()
		
func show_pause_menu():
	get_tree().paused = true;
	$PauseMenu/PauseCanvas.visible = true;
	
func toggle_dev_menu():
	if $DevMenu/DevMenuCanvas.visible == false:
		$DevMenu/DevMenuCanvas.visible = true;
	else:
		$DevMenu/DevMenuCanvas.visible = false;
