extends Area2D

export (PackedScene) var siguiente_nivel
var puede_teletransportarse = false

func _physics_process(delta):
	if puede_teletransportarse and Input.is_action_just_pressed("nextLevel"):
		get_tree().change_scene_to(siguiente_nivel)

func _on_pentagono_body_entered(body):
	if body.is_in_group("jugador"):
		puede_teletransportarse = true

func _on_pentagono_body_exited(body):
	if body.is_in_group("jugador"):
		puede_teletransportarse = false
