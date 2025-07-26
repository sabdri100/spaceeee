extends Area2D

# health of the enemy
@export var Hp : int = 10

func damage(amount : int):
	Hp -= amount
	if Hp <= 0:
		get_parent().queue_free()
