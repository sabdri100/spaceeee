extends Node2D

@onready var enemy_spawner = $EnemySpawner
@onready var levels_timer = $LevelTimer
@onready var asteroid_timer = $AsteroidSpawnTimer
@onready var alien_timer = $AlienSpawnTimer
@onready var timer_label = $TimerLabel

var asteroid_scene = preload("res://enemy/Asteroids/enemy_asteroid.tscn")
var alien_ship_scene = preload("res://enemy/Aliens/alien_ship.tscn")

func _ready():
	levels_timer.start()
	asteroid_timer.start()
	alien_timer.start()
	timer_label.text = str(levels_timer.wait_time)
	
	# Spawnea algunas naves alien al inicio
	spawn_alien_ships()

func _process(_delta: float) -> void:
	var time_left = max(0.0, levels_timer.time_left)
	timer_label.text = str(time_left).pad_decimals(1)

# ============ ASTEROIDES ===============
func _on_asteroid_spawn_timer_timeout():
	spawn_asteroid_from_edge()

func spawn_asteroid_from_edge():
	var asteroid = asteroid_scene.instantiate()
	var screen_size = get_viewport().get_visible_rect().size
	var side = randi() % 4
	var pos = Vector2()

	match side:
		0: pos = Vector2(randf_range(0, screen_size.x), -20)              # Top
		1: pos = Vector2(randf_range(0, screen_size.x), screen_size.y+20) # Bottom
		2: pos = Vector2(-20, randf_range(0, screen_size.y))              # Left
		3: pos = Vector2(screen_size.x+20, randf_range(0, screen_size.y)) # Right

	asteroid.position = pos
	enemy_spawner.add_child(asteroid)

# ============ NAVES ALIEN ===============
func _on_alien_spawn_timer_timeout():
	spawn_alien_ships()

func spawn_alien_ships():
	var screen_size = get_viewport().get_visible_rect().size
	var center = screen_size / 2

	var horizontal_space = screen_size.x / 4
	var vertical_space = screen_size.y / 5

	var positions = [
		center + Vector2(-horizontal_space, -vertical_space),
		center + Vector2(horizontal_space, -vertical_space),
		center + Vector2(0, -vertical_space * 2),
		center + Vector2(0, vertical_space * 0.5)
	]

	for pos in positions:
		var ship = alien_ship_scene.instantiate()
		ship.position = pos
		enemy_spawner.add_child(ship)

# ============ FIN DEL NIVEL ===============
func _on_levels_timer_timeout() -> void:
	asteroid_timer.stop()
	alien_timer.stop()
	
	# Aquí podrías ir al Nivel 4 o pantalla final
	get_tree().change_scene_to_file("res://win_screen.tscn")
