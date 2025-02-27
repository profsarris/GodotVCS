extends Area3D

var player
@export var strength = 25

func _ready() -> void:
	player = get_node("/root/world/player")

func _on_body_entered(body: Node3D) -> void:
	if body == player:
		player.bounce(strength)
