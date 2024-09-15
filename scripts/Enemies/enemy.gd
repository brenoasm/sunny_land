extends CharacterBody2D
class_name Enemy

@export var jump_velocity = -400.0
@export var movement_speed = 30

signal died()
signal started_dying()

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var target_position: Callable
var id: float
var disabled = false
var can_be_hit = true

func _ready() -> void:
	id = RandomNumberGenerator.new().randf_range(0, 100)

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
	
	died.emit()
	queue_free()
	
func setup(target_position: Callable) -> void:
	self.target_position = target_position
	
	var face_direction : int = get_target_direction()
	
	flip(face_direction)
	
func get_target_direction() -> int:
	var target_position : Vector2 = target_position.call()
	
	var jump_direction = 1 if target_position.x > global_position.x else -1
	
	return jump_direction

func flip(_value: float) -> void:
	pass
