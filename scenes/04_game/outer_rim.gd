# https://github.com/godotengine/godot-proposals/issues/1925

@tool
extends Path2D

@export var size: int = 500
@export var num_points: int = 48
@export var asteroids_per_point: int = 15
@export var asteroids_spread: int = 30
@export var rotation_speed: float = 5.0

@export var boundary_scene: PackedScene 
@export var asteroid_scene: PackedScene 


func _ready() -> void:
	curve = Curve2D.new()
	for i in num_points:
		curve.add_point(Vector2(0, -size).rotated((i / float(num_points)) * TAU))

	# End the circle.
	curve.add_point(Vector2(0, -size))

	for i in curve.point_count:
		var pos: Vector2 = curve.get_point_position(i)
		var boundary = boundary_scene.instantiate()
		boundary.position = pos
		boundary.look_at(Vector2(0,0))
		add_child(boundary)
		
		for j in asteroids_per_point:
			var asteroid = asteroid_scene.instantiate()
			asteroid.position.x = pos.x + randi_range(-asteroids_spread,asteroids_spread)
			asteroid.position.y = pos.y + randi_range(-asteroids_spread,asteroids_spread)
			add_child(asteroid)

func _process(delta: float) -> void:
	rotate(deg_to_rad(rotation_speed) * delta)
