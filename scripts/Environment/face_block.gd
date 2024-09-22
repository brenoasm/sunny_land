extends StaticBody2D
class_name FaceBlock

@export var drop_speed: float = 5
@export var drop_delay_start: float = 2
@export var drop_delay_finish: float = 1
@export var recovery_speed: float = 2
@export var recovery_delay_start: float = 2
@export var recovery_delay_finish: float = 1

@export var game_state_manager: GameStateManager

@onready var offensive_area: Area2D = $OffensiveArea

var going_down = false
var going_up = false

var start_position: Vector2
var tween: Tween

func _ready() -> void:
	offensive_area.body_entered.connect(_on_body_entered)
	game_state_manager.game_state_changed.connect(_on_game_state_changed)
	
	start_position = position
	
	drop()
	
func _physics_process(delta: float) -> void:
	if going_down:
		var collider = move_and_collide(Vector2(0, position.y * drop_speed * delta))
		
		if collider != null:
			going_down = false
			
			recover()
			
			return
	
	if going_up:
		position = position.move_toward(start_position, recovery_speed)
		
		if position.distance_to(start_position) <= 0:
			going_up = false
			
			drop()
			
			return

func recover() -> void:
	await get_tree().create_timer(recovery_delay_start).timeout
	
	animate(func(): 
		await get_tree().create_timer(recovery_delay_finish).timeout
		
		going_up = true)

func drop() -> void:
	await get_tree().create_timer(drop_delay_start).timeout
	
	animate(func(): 
		await get_tree().create_timer(drop_delay_finish).timeout
		
		going_down = true, true)

	await get_tree().create_timer(drop_delay_finish).timeout
	
func _on_body_entered(body: Player) -> void:
	if going_down:
		body.kill()
		
		stop()

func _on_game_state_changed(game_state: GameStateManager.GameState) -> void:
	if game_state == GameStateManager.GameState.GAME_OVER:
		stop()
		
func stop() -> void:
	going_down = false
	going_up = false
	
	if (tween != null):
		tween.stop()

func animate(callback: Callable, animate_scale = false) -> void:
	const duration = 0.05
	
	tween = create_tween()
	
	tween.tween_property(self, "position", Vector2(start_position.x + 1, position.y), duration)
	tween.tween_property(self, "position", Vector2(start_position.x, position.y), duration)
	
	if animate_scale:
		tween.tween_property(self, "scale", Vector2(1.1, 1.1), duration)
		
	tween.tween_property(self, "position", Vector2(start_position.x - 1, position.y), duration)
	tween.tween_property(self, "position", Vector2(start_position.x, position.y), duration)
	
	if animate_scale:
		tween.tween_property(self, "scale", Vector2(1, 1), duration)
		
	tween.tween_callback(callback)
