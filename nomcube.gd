extends Area3D

var player
var value = 0.1
var velocity_vector
var rotation_vector_x = Vector3(1, 0, 0)
var rotation_vector_z= Vector3(0, 0, 1)

var speed = 0.5
var rotation_speed = 0.02
const change = 1000
var ticks = 0
var current = randi() % 4

var pattern = [Vector3(speed, 0, 0), Vector3(0, 0, speed), \
	 	   Vector3(-speed, 0, 0), Vector3(0, 0, -speed)]
		
func _ready() -> void:
	player = get_node("/root/world/player")
	velocity_vector = pattern[current]

func _on_body_entered(body: Node3D) -> void:
	if body == player:
		player.grow(value)
		queue_free()

func _process(delta: float) -> void:
	ticks += 1
	if ticks % change == 0:
		current += 1
		velocity_vector = pattern[current%len(pattern)] 
	global_position += velocity_vector*delta
	rotate(rotation_vector_x, rotation_speed)
	rotate(rotation_vector_z, rotation_speed)
