extends Control

@onready var Title = $Title
@onready var inst = $Instrucctions
@onready var continue_buton = $ContinueButon
@onready var exit_button = $ExitButton

func _on_continue_buton_pressed():
	if GameState.current_level_scene_path != "":
		get_tree().change_scene_to_file(GameState.current_level_scene_path)
	else:
		get_tree().change_scene_to_file("res://Levels_logic/Level_1.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
