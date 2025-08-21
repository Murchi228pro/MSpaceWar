extends Node
class_name FSM

var meta = Dictionary()

var state: State

func _ready() -> void:
	for state_ in get_children():
		meta[state_.name] = state_
		state_.fsm = self
	state = meta["Placement"]
	state.start()

func change_state(name: String):
	state.finish()
	state = meta[name]
	state.start()
	
	
