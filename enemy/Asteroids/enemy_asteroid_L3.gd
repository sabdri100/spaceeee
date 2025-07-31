extends RigidBody2D

@onready var sprite_a = $Sprite_A
@onready var sprite_b = $Sprite_B
@onready var col_a = $Collision_A
@onready var col_b = $Collision_B
@onready var notifier = $VisibleOnScreenNotifier2D

# Hace load a las imagenes de los asteroides
var asteorid = [
	preload("res://art/asteroid_Brown2.png"),
	preload("res://art/Asteroid Brown.png")
]


# Selecciona aleatoriamente el asteoride y ajusta size
func _ready():
	randomize()
	var type = randi()%2
	
	if type==0:
		sprite_a.visible = true
		sprite_b.visible = false
		col_a.disabled = false
		col_b.disabled = true
		print("Asteroide A")  # quitar
		
	else:
		sprite_a.visible = false
		sprite_b.visible = true
		col_a.disabled = true
		col_b.disabled = false
		print("Asteroide B")
	
	# Movimiento hacia el centro
	await get_tree().process_frame
	var center = get_viewport().get_visible_rect().size/2
	var direction = (center-global_position).normalized()
	var speed = randf_range(150.0,275.0)
	linear_velocity = direction*speed
	angular_velocity = randf_range(-2.0,2.0)
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
