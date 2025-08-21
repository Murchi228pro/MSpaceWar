extends State

@export var left_wave_path: Path2D
@export var right_wave_path: Path2D

@onready var left_curve = left_wave_path.curve
@onready var right_curve = right_wave_path.curve

@export var wave_start: Marker2D

var move_interval = 0.4

func start():
	for ship: Enemy in group.get_children():
		change_curve(ship)
	connect_ships(check_ships_moved, 1)
		
func change_curve(ship: Enemy):
	var ship_index = ship.get_index()
	ship.queue.add_interval(move_interval * ship_index)
	if ship.is_in_group("right_wave"):
		set_curve(ship, right_curve, wave_start.position)
	elif ship.is_in_group("left_wave"):
		set_curve(ship, left_curve, wave_start.position)
	ship.queue.add_action(func(): ship.position = ship.start_pos)
	
func set_curve(ship: Enemy, curve: Curve2D, pos: Vector2):
	ship.mover.move_to_point(pos)
	ship.queue.add_interval(move_interval)
	ship.mover.move_to_curve(curve)
	
func check_ships_moved():
	for ship: Enemy in group.get_children():
		if ship.queue.tween_is_valid():
			return
	print("Змейка началась... Или нет...")
	fsm.change_state("SnakeMove")
	connect_ships(check_ships_moved, 0)


	
	
