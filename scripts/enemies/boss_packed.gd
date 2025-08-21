extends Node2D

@export var boss_scene: PackedScene
@export var units_anim: AnimationPlayer

func summon_boss():
	var boss = boss_scene.instantiate()
	add_child(boss)
	boss.visible = false
	boss.units_anim = units_anim
	
