extends CharacterBody2D
var respawn_position:Vector2

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

func _ready() -> void:
	respawn_position = global_position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("wkey") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("akey", "dkey")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x < 0:
		# left
		$AnimatedSprite2D.animation = "left"
	elif velocity.x > 0:
		# right
		$AnimatedSprite2D.animation = "right"
	else:
		# jump
		$AnimatedSprite2D.animation = "default"
		
	move_and_slide()

func respawn() -> void: 
	global_position = respawn_position
	
func set_respawn_position(pos:Vector2) -> void:
	respawn_position = pos

func rewind() -> void:
	velocity = Vector2.ZERO
	$rewindingability.rewinding = true
	$CollisionShape2D.set_deferred("disabled" , true)
	
