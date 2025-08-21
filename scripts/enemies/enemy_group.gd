extends Node2D

signal some_killed (price: int)

@export var group: Node

func _ready() -> void:
	EventBus.enemy_system = self
	some_killed.connect(EventBus.update_score)
	

	
