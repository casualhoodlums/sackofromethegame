extends Control

signal spawn_man

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_man_pressed():
	print("OK IM SPAWNING");
	emit_signal("spawn_man");
	

func _on_invincible_pressed():
	print("OK IM INVINCIBLE");
	# Interesting Code
