extends Node

var score: int = 0

var move_handle = false
var attack_handle = false
var score_label: LineEdit
var enemy_system: Node

signal move_pressed_or_released (vec: Vector2)
signal attack_pressed_or_released (pressed: bool)
signal player_killed

var player_lives: bool

func _ready():
	player_lives = true
	player_killed.connect(stop_handling)
	player_killed.connect(func(): player_lives = false)

func _input(event: InputEvent) -> void:
	if move_handle:
		if event.is_action("move_buttons"):
			var vector_input = Input.get_vector("left", "right", "up", "down")
			move_pressed_or_released.emit(vector_input)
	if attack_handle:
		if event.is_action("mouse_touch"):
			if event.is_action_pressed("mouse_touch"):
				attack_pressed_or_released.emit(true)
			else:
				attack_pressed_or_released.emit(false)

func update_ui(next_ui: Control):
	var ui_canvas: CanvasLayer = get_tree().get_first_node_in_group("ui_canvas")
	var prev_ui: Control = ui_canvas.get_child(-1)
	if prev_ui:
		prev_ui.queue_free()
	ui_canvas.add_child(next_ui)
			
func stop_handling():
	move_handle = false
	attack_handle = false
	print("omg")
	
func update_score(value: int):
	score += value
	score_label.text = str(score)


	
