extends Node
class_name HealthComponent

@export var health: int
var MAX_HEALTH = health

signal health_changed (health: int)
signal health_decrease

func change_health(value: int):
	health += value
	if value < 0:
		health_decrease.emit()
	if health < 0:
		health = 0
	health_changed.emit(health)
