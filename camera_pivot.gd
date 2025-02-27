extends Node3D

const FAR = Vector3(0, 3, 5)
const NEAR = Vector3(0, 0.5, 0)

@export var distance = FAR
var player

func _ready():
	player = get_parent()

func _process(delta):
	if player:
		var origin = player.global_transform.origin
		global_transform.origin = origin + distance

		if distance == FAR:
			look_at(origin, Vector3.UP)
		
func toggle():
	if distance == FAR:
		distance = NEAR
	else:
		distance = FAR
