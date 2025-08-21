extends Area2D
class_name HurtBox

@export var health_component: HealthComponent
@export var sprite: HitableSprite

func take_damage(damage: int):
	health_component.change_health(-damage)
	sprite.hit_animate()
