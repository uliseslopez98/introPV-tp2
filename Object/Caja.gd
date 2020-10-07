extends RigidBody2D

signal levitando
signal impulsando
export var fuerza_impul = 1.5
export var vel_levitacion = -10
var seleccionado = false
var puedeLevitar = false
var dejar_de_levitar = false
onready var peso = mass * weight

func _physics_process(delta):
	if !dejar_de_levitar and seleccionado:
		apply_central_impulse(Vector2(0, vel_levitacion))

func _on_Caja_input_event(viewport, event, shape_idx):
	if puedeLevitar and event.is_action_pressed("click") and !seleccionado:
		emit_signal("levitando", self)
		$Timer.start(1.5)
		set_modulate("ffcb00")
		seleccionado = true

func dejar_de_levitar():
	seleccionado = false
	dejar_de_levitar = false
	set_sleeping(false)
	set_modulate("ffffff")
	$Timer.stop()

func impulsar(player_position):
	emit_signal("impulsando")
	dejar_de_levitar()
	apply_central_impulse((position - player_position) * fuerza_impul)

func _on_Timer_timeout():
	if seleccionado:
		set_sleeping(true)
		dejar_de_levitar = true
