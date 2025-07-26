extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("damageable"):
		area.damage(5)
		queue_free()
