extends CharacterBody2D
class_name Bullet

@export var speed: int
var direction: Vector2 = Vector2.ZERO

func collide():
	queue_free()
	
func _ready() -> void:
	$HitBox.body_damaged.connect(collide)
	$VisibleOnScreenNotifier2D.screen_exited.connect(queue_free)

func _physics_process(delta: float) -> void:
	velocity = delta * direction * speed
	move_and_slide()
	
