extends Control

@onready var Title = $Title
@onready var inst = $Instrucctions
@onready var continue_button = $ContinueButon
@onready var exit_button = $ExitButton

func _on_continue_buton_pressed():
	#change to level 2
	GameState.current_level_scene_path = "res://Levels_logic/Level_2.tscn"
	get_tree().change_scene_to_file(GameState.current_level_scene_path)

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
