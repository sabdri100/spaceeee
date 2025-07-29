extends CharacterBody2D

@export var speed := 75
@onready var player = get_tree().get_current_scene().get_node("ship")


func _process(delta: float):
	# Se mueve hacia el jugador
	if player:
		var direction = (player.global_position - global_position).normalized()
		rotation = direction.angle()
		position += direction * speed * delta
