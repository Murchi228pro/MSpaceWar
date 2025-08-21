extends CharacterBody2D

@onready var anim_player := $AnimationPlayer
@onready var anim_tree := $AnimationTree
@onready var gun := $Gun
@onready var laser := $Laser
@onready var health_component := $HealthComponent

@export var units_anim: AnimationPlayer
	
func _ready() -> void:
	pass
	
func set_keys_to_side_sliding(anim_name: String):
	var anim = anim_player.get_animation(anim_name) as Animation
	anim.bezier_track_set_key_value(0, 0, position.x)
	anim.bezier_track_set_key_value(1, 0, position.y)
	anim.bezier_track_set_key_value(2, 0, rotation)
	
func five_shoot():
	gun.five_shoot(rotation)

func laser_shoot():
	laser.laser_switch(true)
	var timer = get_tree().create_timer(0.1)
	await timer.timeout
	laser.laser_switch(false)
	
#func slide_conditions_change(condition: String):
	#var right_slided = anim_tree.get("parameters/conditions/right_slided")
	#var left_slided = anim_tree.get("parameters/conditions/left_slided")
	#if left_slided and right_slided:
		#anim_tree.set("parameters/conditions/two_slided", true)
		#return
	#anim_tree.set("parameters/conditions/" + condition, true)
	
func summon_units():
	if units_anim:
		units_anim.play("shooting")
	
