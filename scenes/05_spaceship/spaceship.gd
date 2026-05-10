extends CharacterBody2D

# followed this tutorial: https://www.youtube.com/watch?v=zDpZ52Ulywg

@export var acceleration: int = 10
@export var max_speed: float = 350.0
@export var rotation_speed: float = 100.0

func _physics_process(delta: float) -> void:
	
	var input_vector: Vector2 = Vector2(0, Input.get_axis("move_forward", "move_backward"))
	
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed*delta))
	
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed*delta))
	
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	
	move_and_slide()
