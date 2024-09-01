extends CharacterBody2D
class_name Enemy

@export var jump_velocity = -400.0
@export var movement_speed = 30

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body = collision.get_collider()
		
		if body is Player:
			body.kill()
#
func apply_x_velocity(xVelocity: float) -> void:
	velocity.x = xVelocity

func apply_y_velocity(yVelocity: float) -> void:
	velocity.y = yVelocity

func kill() -> void:
	apply_x_velocity(0)
	
	queue_free()
