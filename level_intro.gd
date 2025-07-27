extends Control

@onready var Title = $Title
@onready var inst = $Instrucctions
@onready var continue_button = $ContinueButon
@onready var exit_button = $ExitButton

func _on_continue_buton_pressed():
	GameState.current_level_scene_path = "res://Level_1.tscn"
	get_tree().change_scene_to_file(GameState.current_level_scene_path)

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
