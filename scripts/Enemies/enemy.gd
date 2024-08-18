extends CharacterBody2D
class_name Enemy

@export var jump_velocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func apply_x_velocity(xVelocity: float) -> void:
	velocity.x = xVelocity
		
	#if direction_x > 0:
		#animation_player.flip_h = false
	#elif (direction_x < 0):
		#animation_player.flip_h = true

func apply_y_velocity(yVelocity: float) -> void:
	velocity.y = yVelocity
