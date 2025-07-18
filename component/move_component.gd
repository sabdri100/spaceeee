class_name MoveComponent
extends Node

@export var velocity: Vector2
@export var actor: Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	actor.translate(velocity * delta)
