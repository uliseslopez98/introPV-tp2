extends Node2D

func _ready():
	randomize()

func nuevoJuego():
	$Violeta2.inicio($PosVioleta.position)
	$Interface.mostrarMensaje("Comencemos!")

