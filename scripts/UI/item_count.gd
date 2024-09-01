extends HBoxContainer
class_name ItemCount

@export var item_texture: CompressedTexture2D
@export var count: int = 0

@onready var label: Label = $Label
@onready var item: TextureRect = $MarginContainer/Item

func _ready() -> void:
	item.texture = item_texture
	set_count_label()

func increment_count() -> void:
	count += 1
	set_count_label()

func set_count_label() -> void:
	label.text = str(count)
