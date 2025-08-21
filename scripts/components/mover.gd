extends Node

@onready var movable: Enemy = get_parent()
	

func move_to_curve(curve: Curve2D, time: float = 1.0):
	for point in range(curve.point_count):
		var curve_interpolate = _path_interpolate.bind(curve, point)
		movable.queue.add_method(curve_interpolate, 0.0, 1.0, time)

func move_to_point(point: Vector2, time: float = 1.0):
	movable.queue.add_property(movable, "global_position", point, time)

func _path_interpolate(t_: float, curve: Curve2D, point_number: int):
	movable.global_position = curve.sample(point_number, t_)
	
