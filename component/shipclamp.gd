class_name ShipClamp
extends Node2D



@export var actor: Node2D
@export var margin: = 8

var left_border = 0 

var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")

func _process(delta: float) -> void:
	actor.global_position.x = clamp(actor.global_position.x, left_border+margin, right_border-margin)
