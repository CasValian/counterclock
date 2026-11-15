extends Node2D

@onready var trigger = $trigger/shape


func _on_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "player"):
		trigger.set_deferred("disabled" , true)
		body.set_respawn_position(global_position)
	
