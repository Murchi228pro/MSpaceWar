extends Button



func _on_button_down() -> void:
	var tween = get_tree().create_tween()
	animate(tween)
	await tween.finished
	var game_root = get_tree().get_first_node_in_group("gameroot")
	game_root.start_dialog()
	
func animate(tween: Tween):
	if material	and material is ShaderMaterial:
		tween.tween_method(update_progress, -1.5, 1.5, 0.5)
	
func update_progress(value: float):
	if material:
		material.set_shader_parameter("progress", value)
