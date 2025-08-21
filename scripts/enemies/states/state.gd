extends Node
class_name State

@export var tick_delay: Timer
@export var group: Node

var fsm: FSM

func start():
	pass

func begin():
	pass
	
func finish():
	pass

func connect_ships(call: Callable, state: int):
	for ship: Enemy in group.get_children():
		if state == 1:
			if not ship.queue.queue_ended.is_connected(call):
				ship.queue.queue_ended.connect(call)
		elif state == 0:
			if ship.queue.queue_ended.is_connected(call):
				ship.queue.queue_ended.disconnect(call)
				
