extends CharacterBody2D


@export var HEALTH = 10.0

func _physics_process(delta):
	pass

func take_damage(damage: int):
	HEALTH -= damage
	if HEALTH <= 0:
		call_deferred("queue_free")
