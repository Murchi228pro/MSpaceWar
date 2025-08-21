extends Gun

var is_attacking: bool = false
@export var attack_delay: Timer

func _ready() -> void:
	EventBus.attack_pressed_or_released.connect(set_is_attacking)
	
func set_is_attacking(_is_attacking: bool):
	is_attacking = _is_attacking
	if attack_delay.is_stopped():
		shoot(Vector2.UP)
		attack_delay.start()

func _on_attack_delay_timeout() -> void:
	if is_attacking:
		shoot(Vector2.UP)
	else:
		attack_delay.stop()
