extends Control

func _ready():
	$PauseCanvas/PauseContainer/Resume.grab_focus();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_pressed():
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Source/UI/MainMenu.tscn");


func _on_quit_pressed():
	get_tree().quit();


func _on_resume_pressed():
	get_tree().paused = false;
	$PauseCanvas.visible = false;
