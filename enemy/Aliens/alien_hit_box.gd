extends Area2D

@export var hp : int = 10

func damage(amount : int):
	hp -= amount
	if hp <= 0:
		#get_tree().current_scene.call_deferred("_check_if_level_cleared")
		get_parent().queue_free()
