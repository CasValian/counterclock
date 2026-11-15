extends Node

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rewind"):
		rewind()
		
func rewind() -> void:
	$player.rewind()
	
	$CanvasLayer.visible = true
	await(get_tree().create_timer(2.0).timeout)
	$CanvasLayer.visible = false


func _on_timer_timeout() -> void:
	pass
