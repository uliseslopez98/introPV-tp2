extends Node2D

onready var plataformaIzq = $plataformaIzq
onready var plataformaDer = $plataformaDer

func _ready():
	plataformaIzq.start(plataformaDer, $joinIzq)
	plataformaDer.start(plataformaIzq, $joinDer)

func _physics_process(delta):
	pass
