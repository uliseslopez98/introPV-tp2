extends RigidBody2D

var otra_plataforma
onready var initial_position = position
var top_max
var bottom_max

func start(plataforma, _joint):
	otra_plataforma = plataforma
	bottom_max = (_joint.length - _joint.initial_offset) + position.y
	top_max = bottom_max - _joint.length

func _ready():
	add_central_force(Vector2(0, -weight * 10))

func _physics_process(delta):
	var fuerza = fuerza_total()
	if fuerza != otra_plataforma.applied_force.y:
		otra_plataforma.set_applied_force(Vector2(0, fuerza))

	if applied_force == otra_plataforma.applied_force:
		set_linear_velocity(Vector2.ZERO)

func fuerza_total():
	var fuerza = -weight * 10
	for body in get_colliding_bodies():
		if body.is_in_group("caja") or body.is_in_group("player"):
			fuerza -= body.weight * 10
	return fuerza
