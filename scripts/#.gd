extends Node2D

@onready var UI = $UI
@export var first_dialog_scene: PackedScene
@export var game_scene: PackedScene

func start_dialog():
	var first_dialog = first_dialog_scene.instantiate()
	EventBus.update_ui(first_dialog)

func start_game():
	var game = game_scene.instantiate()
	add_child(game)
