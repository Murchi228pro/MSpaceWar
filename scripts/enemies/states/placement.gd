extends State

var counter
var move_interval = 0.2
@onready var player = get_tree().get_first_node_in_group("player")

func start():
	counter = 10
	for ship: Enemy in group.get_children():
		set_ship_moving(ship)
	tick_delay.start()
	tick_delay.timeout.connect(random_ship_shoot)

func set_ship_moving(ship: Enemy):
	var ship_num = ship.get_index()
	ship.queue.add_interval(move_interval * ship_num)
	ship.mover.move_to_point(ship.shoot_pos)

func random_ship_shoot():
	var ship = group.get_children().pick_random() as Enemy
	ship.queue.add_action(ship.gun.shoot.bind(Vector2.DOWN))
	counter -= 1
	if counter == 0:
		print("State Ща подгорать будет")
		fsm.change_state("WaveMove")
	
func finish():
	tick_delay.stop()
	tick_delay.timeout.disconnect(random_ship_shoot)
		
