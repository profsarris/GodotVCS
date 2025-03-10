extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 0.05

func _ready():
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("camera_toggle"):
		$CameraPivot.toggle()

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if Input.is_action_pressed("ui_left"):
		self.rotate_y(TURN_SPEED)
	if Input.is_action_pressed("ui_right"):
		self.rotate_y(-TURN_SPEED)	
				
	move_and_slide()
	
	
func bounce(strength):
	velocity.y += strength
	move_and_slide()

func grow(size):
	var sizevec = Vector3(size, size, size)
	$CollisionShape3D/MeshInstance3D.tweeny(sizevec)
	$CollisionShape3D.tweeny(sizevec)


	
