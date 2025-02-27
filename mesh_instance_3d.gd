extends MeshInstance3D

func tweeny(amount):
	var tween = create_tween()
	tween.tween_property($".", 'scale', scale + amount, 1)
