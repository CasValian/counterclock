extends Node2D
@onready var platform = $door_sprite
@onready var platform_collision = $door_collision/door_othercollision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	platform.show()
	platform_collision.disabled = false

func activate() -> void:
	platform.hide()
	platform_collision.set_deferred("disabled", true)
