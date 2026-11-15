extends Node2D

@onready var player = get_parent()

var replay_duration: float = 2.0
var rewinding: bool = false
var rewind_value = {"position": []}

func _physics_process(delta: float) -> void:
	if not rewinding:
		if rewind_value["position"].size() >= replay_duration * Engine.physics_ticks_per_second:
			rewind_value["position"].pop_front()
		rewind_value["position"].append(player.global_position)
	else:
		compute_rewind(delta)

func compute_rewind(delta: float) -> void:
	if rewind_value["position"].is_empty():
		player.get_node("CollisionShape2D").set_deferred("disabled", false)
		rewinding = false
		return
	var rewind_pos = rewind_value["position"].pop_back()
	rewind_pos[1] += -10
	rewind_pos[0] += -10
	print(rewind_pos)
	player.global_position = rewind_pos
