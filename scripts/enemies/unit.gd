extends Node2D

@export var look_allow: bool
@onready var player = get_tree().get_first_node_in_group("player")
@onready var gun = $Gun


func _physics_process(delta: float) -> void:
	if look_allow and EventBus.player_lives:
		look_at(player.global_position)
