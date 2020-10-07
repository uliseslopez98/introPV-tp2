extends Node2D

onready var cajas = get_tree().get_nodes_in_group("caja")
var caja_levitando = false

func _physics_process(delta):
	for caja in cajas:
		caja.puedeLevitar = caja.position.distance_to($Violeta.position) < 250
		if caja.seleccionado and Input.is_action_just_pressed("empujar"):
			caja.impulsar($Violeta.position)

func _on_caja_levitando(caja):
	if caja_levitando:
		for c in cajas:
			if c != caja:
				c.dejar_de_levitar()
	caja_levitando = true

func _on_caja_impulsando():
	caja_levitando = false
