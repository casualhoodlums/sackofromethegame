extends CharacterBody2D


# Constant/Exported Vars
@export var SPEED = 200.0
@export var ACCELERATION = 1000.0
@export var FRICTION = 600.0

@export var MAX_VELOCITY = Vector2(200.0, 200.0)
@export var MIN_VELOCITY = Vector2.ZERO

# Node refereneces
@onready var player_sprite = $PlayerSprite
@onready var player_collison = $PlayerCollison
@onready var camera_2d = $Camera2D

@onready var main_attack_hitbox = $MainAttackHitbox
@onready var hitbox_collision = $MainAttackHitbox/HitboxCollision
@onready var attack_timer = $AttackTimer

@onready var attack_sound = preload("res://Sound/swoosh.wav")

# state so attack doesn't repeat right now, but also will prob need in future.
enum PlayerState {
	IDLE,
	ATTACKING,
}

@onready var current_state = PlayerState.IDLE
# called when the node enters the scene tree for the first time.
func _ready():
	attack_timer.wait_time = 0.05
	hitbox_collision.disabled = true
#	main_attack_hitbox.monitorable = false

## unused for now but might be useful in future.
#func _unhandled_input(event):
#	if event is InputEventMouseButton:
#		if event.button_index == MOUSE_BUTTON_LEFT:
#			main_attack()

func _process(delta):
	if Input.is_action_just_pressed("main_attack"):
		player_sprite.play("default")
		# if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = attack_sound;
		$AudioStreamPlayer2D.play();
		main_attack()

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.y = Input.get_axis("move_up", "move_down")
	input_vector.x = Input.get_axis("move_left", "move_right")
	
	self.look_at(get_global_mouse_position())
	self.rotation_degrees -= -90
	input_vector = input_vector.normalized()
	if input_vector:
		velocity.x = move_toward(velocity.x, SPEED * input_vector.x, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, SPEED * input_vector.y, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
		
	
	move_and_slide()

func main_attack():
	if current_state != PlayerState.ATTACKING:
		main_attack_hitbox.show()
		hitbox_collision.disabled = false
		attack_timer.start()
		current_state = PlayerState.ATTACKING

# callback functions
func _on_attack_timer_timeout():
	main_attack_hitbox.hide()
	hitbox_collision.disabled = true
	current_state = PlayerState.IDLE
	print("hidden")

