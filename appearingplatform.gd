extends Node2D
@onready var platform = $platform
@onready var platform_collision = $platformcollision/collision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	platform.hide()
	platform_collision.disabled = true

func activate() -> void:
	platform.show()
	platform_collision.set_deferred("disabled", false)
