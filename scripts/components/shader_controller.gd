extends Sprite2D
class_name HitableSprite

@export var hit_animations_count: int
@export var max_whiter: float
@export var time: float

var anim_tween: Tween


func hit_animate():
	anim_tween = hit_animate_manually(hit_animations_count, max_whiter, time)
	
		
		
func hit_animate_manually(hit_animations_count, max_whiter, time):
	var step_time = time/hit_animations_count
	
	if not (anim_tween and anim_tween.is_running()):
		anim_tween = create_tween()
	else:
		return
		
	for counter in range(hit_animations_count):
		anim_tween.tween_method(whiter_interpolate, 0.0, max_whiter, step_time)
		anim_tween.tween_callback(whiter_interpolate.bind(0))
		
	return anim_tween
	

		
func whiter_interpolate(t: float):
	if material: 
		material.set_shader_parameter("whiteness", t)
