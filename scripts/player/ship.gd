extends CharacterBody2D

var direction: Vector2
var speed: int = 7000

@onready var anim = $AnimationPlayer
@onready var health_component = $HealthComponent
@onready var gun = $Gun

enum {
	DEFAULT,
	HIT_TAKED
}

var state

func _ready() -> void:
	EventBus.move_handle = true
	EventBus.attack_handle = true
	state = DEFAULT
	EventBus.move_pressed_or_released.connect(change_direction)
	health_component.health_decrease.connect(change_hit_take_state)

func _physics_process(delta: float) -> void:
	match state:
		DEFAULT:
			change_direction(direction)
		HIT_TAKED:
			hit_take_action()
	velocity = direction * speed * delta
	move_and_slide()
	
func change_direction(vec: Vector2):
	direction = vec
	move_action(vec)
	
	
func hit_take_action():
	if health_component.health == 0:
		anim.play("death")
	else:
		anim.play("take_hit")
		await anim.animation_finished
		state = DEFAULT
		Area2D

func move_action(vec: Vector2):
	if state == HIT_TAKED:
		return
	if vec == Vector2.ZERO:
		anim.play("idle")
	else:
		anim.play("move")
		
func deathing_call_and_stop_move():
	direction = Vector2.ZERO
	EventBus.player_killed.emit()
	
func change_hit_take_state():
	state = HIT_TAKED
