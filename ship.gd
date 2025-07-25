extends Node2D

@onready var leftcannon: Marker2D = $leftcannon
@onready var rightcannon: Marker2D = $rightcannon
@onready var spawn_comp: SpawnComp = $SpawnComp
@onready var fire_rate: Timer = $FireRate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate.timeout.connect(fire_bullet)
	pass # Replace with function body.

func fire_bullet() -> void:
	
	var scene_root = get_tree().current_scene
	spawn_comp.spawn(leftcannon.global_position, scene_root)
	spawn_comp.spawn(rightcannon.global_position, scene_root)

func _physics_process(delta: float) -> void:
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0, viewRect.size.x )
	position.y = clamp(position.y, 0, viewRect.size.y)
