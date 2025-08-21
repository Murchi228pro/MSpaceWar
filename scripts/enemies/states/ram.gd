extends State

@export var snakes: Array[Path2D]
var curve: Curve2D

func change_random_curve():
	var curve = snakes.pick_random().curve
	return curve

func start():
	
	curve = change_random_curve()
	
	for ship: Enemy in group.get_children(): # Начало движения
		var delay = ship.get_index() * 0.2
		ship.queue.add_interval(delay)
		ship.mover.move_to_point(ship.shoot_pos)
		
		if ship.is_in_group("left_wave"):
			ship_to_curve(ship, delay)
			ship.queue.queue_ended.connect(check_ships)
	
	tick_delay.start()
	tick_delay.timeout.connect(random_ship_shoot)
			
func random_ship_shoot():
	var ships = group.get_children()
	ships.shuffle()
	for ship in ships:
		if ship.is_in_group("right_wave"):
			ship.gun.shoot(Vector2.DOWN)
			return

func ship_to_curve(ship: Enemy, delay: float):
	ship.queue.add_interval(2.3)
	ship.queue.add_interval(delay)
	ship.mover.move_to_point(curve.get_point_position(0))
	ship.mover.move_to_curve(curve)

func check_ships():
	for ship: Enemy in group.get_children():
		if ship.queue.tween_is_valid():
			return
	fsm.change_state("Placement")

func finish():
	for ship: Enemy in group.get_children():
		if ship.is_in_group("right_wave"):
			ship.mover.move_to_point(ship.start_pos)
		elif ship.is_in_group("left_wave"):
			ship.global_position = ship.start_pos
			ship.queue.queue_ended.disconnect(check_ships)
	tick_delay.timeout.disconnect(random_ship_shoot)
	tick_delay.stop()
	
