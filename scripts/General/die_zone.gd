extends Area2D

func _ready() -> void:
	var has_collision_shape = false
	
	for child in get_children():
		if child is CollisionShape2D:
			has_collision_shape = true
			break
			
	assert(has_collision_shape, "This component need a collision shape.")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.kill()
	if body is Enemy:
		body.kill()
