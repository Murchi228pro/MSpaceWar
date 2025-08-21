extends Node2D

@export var enemies: Node
@export var boss_manager: Node
@export var ui_scene: PackedScene

func _ready() -> void:
	enemies.some_killed.connect(check_all_and_summon_boss)
	var ui = ui_scene.instantiate()
	EventBus.update_ui(ui)
	

func check_all_and_summon_boss(null_argument):
	if enemies.group.get_child_count() == 1: # Тип убит, но всё еще есть в ноде
		boss_manager.units_anim.play("start_boss_action")
