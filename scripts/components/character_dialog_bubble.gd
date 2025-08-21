extends Control

@export var next_scene: PackedScene

func _ready() -> void:
	EventBus.attack_handle = true
	EventBus.attack_pressed_or_released.connect(_next)
	
	
func _next(pressed: bool):
	if not pressed:
		return
	elif check_end():
		return
	var next = next_scene.instantiate()
	EventBus.update_ui(next)
	
func check_end():
	if not next_scene:
		var game_root = get_tree().get_first_node_in_group("gameroot")
		if game_root:
			game_root.start_game()
		return true
	return false
		
