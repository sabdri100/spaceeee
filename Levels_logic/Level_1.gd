extends Node2D

@onready var enemy_spawner = $EnemySpawner
@onready var levels_timer = $LevelsTimer
@onready var asteroid_timer = $AsteroidSpawnTimer
@onready var level_intro = get_node_or_null("LevelIntro")

@onready var timer_lable = $TimerLable  # hice esto

var asteroid_scene = preload("res://enemy/Asteroids/enemy_asteroid.tscn")
var curr_level = 1

func _ready():
	# Maneja los asteroid (Nivel 1)
	levels_timer.start() # hice esto
	asteroid_timer.start()
	timer_lable.text = str(levels_timer.wait_time) # hice esto

func _process(delta: float) -> void:  # hice esto
	var time_left = max(0.0, levels_timer.time_left)
	timer_lable.text = str(time_left).pad_decimals(1)

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
	enemy_spawner.add_child(asteroid)

func _on_asteroid_spawn_timer_timeout():
	spawn_asteroid_from_edge()

func _on_levels_timer_timeout() -> void:
	asteroid_timer.stop()
	get_tree().change_scene_to_file("res://Intro_Scenes/level_2_intro.tscn")
