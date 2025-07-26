extends Control
  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() :
	self.visible = false  
	get_tree().change_scene_to_file("res://main.tscn")


func _on_exit_2_pressed() -> void:
	get_tree().quit()
