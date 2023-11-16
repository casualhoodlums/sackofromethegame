extends CharacterBody2D

@export var SPEED = 200.0
@export var ACCELERATION = 1000.0
@export var FRICTION = 600.0

@export var MAX_VELOCITY = Vector2(200.0, 200.0)
@export var MIN_VELOCITY = Vector2.ZERO

@onready var player_sprite = $PlayerSprite
@onready var player_collison = $PlayerCollison
@onready var camera_2d = $Camera2D


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.y = Input.get_axis("move_up", "move_down")
	input_vector.x = Input.get_axis("move_left", "move_right")
	
	input_vector = input_vector.normalized()
	if input_vector:
		rotation = input_vector.angle() + (PI / 2)
		velocity.x = move_toward(velocity.x, SPEED * input_vector.x, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, SPEED * input_vector.y, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
		
	
	print(velocity)
	move_and_slide()
	# # Get the input direction and handle the movement/deceleration.
	# # As good practice, you should replace UI actions with custom gameplay actions.
	# var direction = Input.get_action_strength("move_up" - "move_down")

	# if direction:
	# 	velocity.x = direction * SPEED
	# else:
	# 	velocity.x = move_toward(velocity.x, 0, SPEED)

	# move_and_slide()
