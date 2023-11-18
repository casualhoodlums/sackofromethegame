extends StaticBody2D

@onready var trigger = $Trigger
@onready var closeDoor = $AnimatedSprite2D
@onready var blockDoor = $DoorClosed
@onready var doorShut = false

@export var reverseEntrance = false
@onready var triggerBox = $Trigger/TriggerBox
# Called when the node enters the scene tree for the first time.
func _ready():
	trigger.connect("body_entered", _shut_door)
	if reverseEntrance:
		triggerBox.move_local_y(34)

func _shut_door(body: Node2D):
	if not doorShut:
		doorShut = true
		closeDoor.play()
		blockDoor.set_deferred("disabled", false)
		trigger.disconnect("body_entered", _shut_door)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
