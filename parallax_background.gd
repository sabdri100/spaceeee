extends ParallaxBackground

@onready var parallax_layer: ParallaxLayer = %ParallaxLayer
@onready var parallax_layer_2: ParallaxLayer = %ParallaxLayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parallax_layer_2.motion_offset.y += 20 * delta
