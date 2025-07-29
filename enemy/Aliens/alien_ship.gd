extends Area2D

@export var hp : int = 15
@export var movement : float = 20
@export var move_speed : float = 2

var pos : Vector2
var time_passed : float = 0.0

func _ready():
	pos = position

func _process(delta: float):
	time_passed += delta
	var x_movement = sin(time_passed*move_speed)*movement
	position.x = pos.x + x_movement

func spawn_aliens():
	var alien_scene = preload("res://enemy/Aliens/enemy_aliens.tscn")
	
	for offset in [-20,20]:
		var alien = alien_scene.instantiate()
		alien.global_position = global_position + Vector2(offset,0)
		get_parent().call_deferred("add_child", alien)
	
func damage(amount : int):
	hp -= amount
	if hp <= 0:
		spawn_aliens()
		queue_free()
		#get_tree().current_scene.call_deferred("_check_if_level_cleared")
