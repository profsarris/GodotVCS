extends RigidBody3D

@export var speed = 50.0
var player

func _ready(): 
	player = get_node("/root/world/player")
	
func _on_timer_timeout() -> void:
	var direction = global_position.direction_to(player.global_position)
	var force = direction * speed
	apply_central_force(force)
