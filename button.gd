extends Node2D
@export var target : Node2D
@onready var active_state = $active
@onready var inactive_state = $inactive
@onready var button_trigger = $trigger/triggercollision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active_state.show()
	inactive_state.hide()


func _on_trigger_body_entered(body: Node2D) -> void:
	if body.name == "player":
		active_state.hide()
		inactive_state.show()
		if target != null:
			target.activate()
		button_trigger.set_deferred("disabled" , true)
