extends KinematicBody2D

var speed = 150
var jump = -100
var direccion = 0
var velocity = Vector2.ZERO
var weight = 39.2
var jumping = false

func _ready():
	pass 

func _physics_process(delta):
	direccion = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.y += 4
	if direccion == 1:
		velocity.x = speed
	elif direccion == -1:
		velocity.x = -speed
	else:
		velocity.x = 0
	if is_on_floor(): 
		velocity.y = 0
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = jump
	move_and_slide(velocity, Vector2(0, -1), false, 4, PI/4, false)
