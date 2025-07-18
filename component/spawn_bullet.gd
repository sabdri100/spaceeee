class_name SpawnComp
extends Node2D

@export var scene: PackedScene
# Called when the node enters the scene tree for the first time.
func spawn(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: Scene export")

	var instance = scene.instantiate()
	
	parent.add_child(instance)
	
	instance.global_position = global_spawn_position
	
	return instance
