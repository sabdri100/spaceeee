extends Node2D

@onready var alien_timer = $AlienSpawnTimer
@onready var enemy_spawn = $EnemeySpawner
@onready var asteroid_timer = $AsteroidSpawnTimer
@onready var level_timer = $LevelTimer
@onready var timer_label = $TimerLabel

@onready var alienShip_scene = preload("res://enemy/Aliens/alien_ship.tscn")
var asteroid_scene = preload("res://enemy/Asteroids/enemy_asteroid.tscn")

#var level_cleared := false

func _ready():
	alien_timer.start()
	asteroid_timer.start()
	level_timer.start()
	spawn_alien_ships()

func spawn_alien_ships():
	var screen_size = get_viewport_rect().size
	var center = screen_size/2
	
	# Espacios desde el centro
	var horizontal_space = screen_size.x/4
	var vertical_space = screen_size.y/5
	
	# Posiciones
	var positions = [
		center+Vector2(-horizontal_space,0) + Vector2(0,-vertical_space),
		center+Vector2(horizontal_space,0) + Vector2(0,-vertical_space),
		center+Vector2(0,-vertical_space) + Vector2(0,-vertical_space),
		center+Vector2(0,vertical_space*1.5) + Vector2(0,-vertical_space)
	]
	
	for pos in positions:
		var mob_ship = alienShip_scene.instantiate()
		mob_ship.position = pos
		add_child(mob_ship)

func spawn_asteroid_from_edge():
	var asteroid = asteroid_scene.instantiate()
	var screen_size = get_viewport().get_visible_rect().size
	
	# Elegir borde al azar
	var side = randi()%4
	var pos = Vector2()
	
	match side:
		0: # Top
			pos = Vector2(randf_range(0,screen_size.x),-20)
		1: # Bottom
			pos = Vector2(randf_range(0,screen_size.x),screen_size.y+20)
		2: # Left
			pos = Vector2(-20, randf_range(0,screen_size.y))
		3: # Right
			pos = Vector2(screen_size.x+20,randf_range(0,screen_size.y))
	
	asteroid.position = pos
	enemy_spawn.add_child(asteroid)

func _on_asteroid_spawn_timer_timeout():
	spawn_asteroid_from_edge()
	
func _process(delta: float):
	var time_left = max(0.0, level_timer.time_left)
	timer_label.text = str(time_left).pad_decimals(1)

#func _check_if_level_cleared():
#	if level_cleared:
#		return
		
#	var mobs = get_tree().get_nodes_in_group("enemy")
#	if mobs.size() == 0:
#		level_cleared = true
#		call_deferred("on_level_timer_timeout")

func _on_level_timer_timeout() -> void:
	alien_timer.stop()
	
#	if level_cleared:
	get_tree().change_scene_to_file("res://win_screen.tscn")
#	else:
		#get_tree().change_scene_to_file("res://lose_screen.tscn")
#		call_deferred("_go_to_lose_screen")

func _on_alien_spawn_timer_timeout() -> void:
	pass # Replace with function body.
