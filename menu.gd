extends Control
  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_pressed() :
	self.visible = false  
	GameState.current_level_scene_path = "res://Levels_logic/Level_1.tscn"
	get_tree().change_scene_to_file("res://Intro_Scenes/level_intro.tscn")


func _on_exit_2_pressed() -> void:
	get_tree().quit()
