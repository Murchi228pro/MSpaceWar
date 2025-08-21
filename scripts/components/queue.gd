extends Node
class_name ActionQueue

var tween: Tween
var node: Node

signal queue_ended

func _ready() -> void:
	node = get_parent()

func add_action(call_: Callable):
	if tween.is_running():
		await tween.finished
	call_.call()
	
func add_property(obj: Node, prop: NodePath, final, duration: float):
	valid_tween()
	tween.tween_property(obj, prop, final, duration)
	
func add_method(call_: Callable, from, to, duration: float):
	valid_tween()
	tween.tween_method(call_, from, to, duration)
	
func add_interval(duration: float):
	valid_tween()
	tween.tween_interval(duration)

func valid_tween():
	if not tween_is_valid():
		node = get_parent()
		tween = node.create_tween()
		tween.finished.connect(queue_ended.emit)

func tween_is_valid():
	if not (tween and tween.is_running()):
		return false
	return true
