extends Node2D

var scene = preload("res://scenes/BasicEnemyMan.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# pass # Replace with function body.


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


func _on_dev_menu_spawn_man():
	var instance = scene.instantiate()
	add_child(instance)
