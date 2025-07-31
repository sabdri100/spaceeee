class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent

func _input(_event: InputEvent) -> void:
	var input_axis_x = Input.get_axis("move_left", "move_right")
	var input_axis_y = Input.get_axis("move_up", "move_down")
	move_component.velocity = Vector2(input_axis_x, input_axis_y).normalized() * 120
	
