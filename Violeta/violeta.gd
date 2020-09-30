extends KinematicBody2D

export (int) var run_speed = 200
export (int) var jump_speed = -800
export (int) var gravity = 1200
var velocity = Vector2()
var jumping = true
var limite

#signal gameOver
#signal levelCompleted

func _ready():
	hide()
	limite = get_viewport_rect().size
	
func inicio(pos):
	position = pos
	show()
	$CollisionPolygon2D.disabled = false
	
func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
	position.x = clamp(position.x, 40, limite.x - 40)
	position.y = clamp(position.y, 40, limite.y - 40)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = true
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
