extends KinematicBody2D

signal finished

var velocidad = Vector2(0,0)
var distancia = Vector2(0,0)
var aceleracion = 80
var gravedad = 350
var v_salto = 250
var direccion = Vector2(0,0)

var limite

func _ready():
	hide()
	limite = get_viewport_rect().size

func inicio(pos):
	position = pos
	show()
	$CollisionPolygon2D.disabled = false

func _physics_process(delta):
	aplicarGravedad(true, delta)
	
func _input(event):
	direccion.x = int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	if direccion.x != 0:
		get_node("Position2D").scale = Vector2(direccion.x,1)
	return event

func aplicarGravedad (value, delta):
	if value:
		velocidad.y += gravedad * delta
		var colInfo = move_and_slide(velocidad, Vector2(0,-1)) #(0,1)
		
		if get_slide_count() != 0:
			var cuerpo = get_slide_collision(get_slide_count()-1)
			
			if cuerpo.normal == Vector2(0,-1):
				velocidad.y = 0
			
			if is_on_floor():
				velocidad.y = 0
				
				if Input.is_action_pressed("ui_up"):
					emit_signal("finished", "Saltando")
		
		return colInfo
	else:
		return






