extends CharacterBody2D
class_name Enemy

var score_add: int = 30
# Компоненты
@onready var sprite := $HitableSprite
@onready var health_component := $HealthComponent
@onready var gun := $Gun
@onready var mover := $Mover
@onready var enemy_system := get_parent().get_parent()

# Экспорты
@export var shoot_pos_marker: Marker2D
@export var queue: ActionQueue
# Позиции
@onready var start_pos: Vector2 = global_position
@onready var shoot_pos: Vector2 = shoot_pos_marker.position

var killed: bool = false


func _ready() -> void:
	sprite.material = sprite.material.duplicate()
	health_component.health_changed.connect(death_check)

func _process(delta: float) -> void:
	move_and_slide()



func death_check(health: int):
	if killed:
		return
	if health <= 0:
		killed = true
		velocity = Vector2.ZERO
		enemy_system.some_killed.emit(score_add)
		var anim = sprite.hit_animate_manually(1, 1.0, 0.2)
		if anim:
			await anim.finished
		queue_free()

	


func _on_hurt_box_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
