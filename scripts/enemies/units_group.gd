extends Node2D

@export var units: Array[Node2D]

func random_shoot():
	var unit = units.pick_random()
	var unit_direction = Vector2(cos(unit.global_rotation), sin(unit.global_rotation))
	unit.gun.shoot(unit_direction)
