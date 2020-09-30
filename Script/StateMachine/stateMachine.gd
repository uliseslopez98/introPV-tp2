extends Node

var stateMap = {}
var currentState = null
var _active = false setget setActive

func _ready():
	for child in get_children():
		child.connect("finished", self, "changeState")
	owner.connect("finished", self, "changeState")
	setActive(false)
	
func _input(event):
	currentState.handle_input(event)

func _physics_process(delta):
	currentState.update(delta)
	
func changeState(stateName):
	if not _active:
		return
	
	currentState = stateMap[stateName]
	currentState.enter()

func setActive(value):
	_active = value
	
	set_physics_process(_active)
	set_process_input(_active)
	
	if not _active:
		currentState = null
		



