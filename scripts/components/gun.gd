extends Node2D
class_name Gun

@export var bullet_scene: PackedScene

func shoot(vec: Vector2):
	var bullet = bullet_scene.instantiate()
	bullet.position = global_position
	bullet.direction = vec
	bullet.look_at(bullet.global_position + vec)
	var game = get_tree().get_first_node_in_group("game")
	if game:
		game.add_child(bullet)
	else:
		add_child(bullet)
