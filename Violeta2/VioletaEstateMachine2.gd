extends "res://Script/StateMachine/stateMachine.gd"

func _ready():
	stateMap = {
		"Quieta":$Quieta,
		"Saltando":$Saltando,
		"Moviendose":$Moviendose,
		"LevitandoCaja":$LevitandoCaja,
		"EmpujandoCaja":$EmpujandoCaja,
		"Muerta":$Muerta,
	}
	.setActive(true)
	changeState("Quieta")
	
func changeState(stateName):
	.changeState(stateName)


