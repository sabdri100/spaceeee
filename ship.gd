extends Node2D

@onready var leftcannon: Marker2D = $leftcannon
@onready var rightcannon: Marker2D = $rightcannon
@onready var spawn_comp: SpawnComp = $SpawnComp
@onready var fire_rate: Timer = $FireRate
@onready var move_component: MoveComponent = $MoveComponent
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	fire_rate.timeout.connect(fire_bullet)
	position_ship_bottom_center()

func _physics_process(_delta: float) -> void:
	clamp_position_to_screen_bounds()

func fire_bullet() -> void:
	var scene_root = get_tree().current_scene
	spawn_comp.spawn(leftcannon.global_position, scene_root)
	spawn_comp.spawn(rightcannon.global_position, scene_root)

func get_sprite_half_size() -> Vector2:
	var tex = sprite.sprite_frames.get_frame_texture(sprite.animation, sprite.frame)
	if tex == null:
		return Vector2.ZERO
	return Vector2(tex.get_width(), tex.get_height()) * sprite.scale * 0.5

func position_ship_bottom_center(padding: float = 10.0) -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var half_size = get_sprite_half_size()
	position = Vector2(
		screen_size.x * 0.5,
		screen_size.y - half_size.y - padding
	)

func clamp_position_to_screen_bounds() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var half_size = get_sprite_half_size()
	position.x = clamp(position.x, half_size.x, screen_size.x - half_size.x)
	position.y = clamp(position.y, half_size.y, screen_size.y - half_size.y)
