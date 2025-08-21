extends Gun

@export var laser_scene: PackedScene

func direction_from_angle(rotation_angle: float) -> Vector2:
	var gun_angle = rotation_angle
	return Vector2(cos(rotation_angle), sin(rotation_angle))

func five_shoot(rotation_angle: float):
	var delay = 0.3
	for direct in range(-2, 3, 1): #Выстрел 5 пуль
		var direction = direction_from_angle(rotation_angle + direct*delay + PI/2)
		shoot(direction)
