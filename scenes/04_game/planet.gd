extends StaticBody2D

@export var target: Node2D
@export var distance: float = 50.0
@export var speed: float = 5.0
@export var start_angle: float = 0.0

var current_angle: float = 0.0

# following this tutorial: https://www.youtube.com/watch?v=-hu-SmXzlRc

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target == null:
		push_error("No valid target to orbit")
		return
	
	current_angle += deg_to_rad(speed) * delta
	
	var x = target.global_position.x + cos(start_angle + current_angle) * distance
	var y = target.global_position.y + sin(start_angle + current_angle) * distance

	global_position = Vector2(x, y)
