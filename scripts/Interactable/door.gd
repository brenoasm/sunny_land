extends Interactable
class_name Door

@export var crank: Crank
@export var active_sprite: Texture2D
@export var inactive_sprite: Texture2D
@export var game_state_manager: GameStateManager

@onready var sprite_2d: Sprite2D = $Sprite2D

var is_active = false

func _ready() -> void:
	is_active = false
	sprite_2d.texture = inactive_sprite
	
	crank.active.connect(_on_active)
	crank.inactive.connect(_on_inactive)

func interact() -> void:
	super()
	
	game_state_manager.win_level()
	
func _on_active() -> void:
	is_active = true
	sprite_2d.texture = active_sprite
		
func _on_inactive() -> void:
	is_active = false
	sprite_2d.texture = inactive_sprite

func can_interact() -> bool:
	return can_be_interacted && is_active
