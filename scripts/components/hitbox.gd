extends Area2D
class_name HitBox

signal body_damaged

@export var damage: int

func _ready() -> void:
	if not (area_entered.is_connected(_on_area_entered)):
		area_entered.connect(_on_area_entered)

func deal_damage(hurtbox: HurtBox):
	hurtbox.take_damage(damage)
	body_damaged.emit()


func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		area.take_damage(damage)
		body_damaged.emit()
