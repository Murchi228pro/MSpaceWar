extends Node2D

@onready var raycast := $LineHitBox
@onready var line := $Line2D
@onready var particles := $CPUParticles2D
@onready var colliding_particles := $CPUParticles2D2
@onready var default_y = line.get_point_position(1).y

@export var damage: int

func _ready() -> void:
	raycast.enabled = false
	line.visible = false
	particles.emitting = false

func laser_switch(condition: bool):
	raycast.enabled = condition
	line.visible = condition
	particles.emitting = condition
	

func _process(delta: float) -> void:
	var ray = raycast as RayCast2D
	if ray.is_colliding():
		var collider = ray.get_collider()
		check_hurtbox_and_damaged(collider)
		
	else:
		cut_line(default_y)
		colliding_particles.emitting = false
	

func deal_damage(damageble: HurtBox):
	damageble.take_damage(damage)

func check_hurtbox_and_damaged(collider):
	if collider is HurtBox:
		deal_damage(collider)
		colliding_particles.emitting = true
		cut_line(collider.global_position.y - 40)

func cut_line(y: int):
	var current_x = line.get_point_position(1).x
	line.set_point_position(1, Vector2(current_x, y))
	colliding_particles.position.y = y
