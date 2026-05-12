extends StaticBody2D

@export var planet_scene: PackedScene 


var safe_zone_inner: int = 100
var safe_zone_outer: int = 950
var number_of_planets: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# define number of planets
	# divide up space between here and 1000 with some buffer
	# pass up the buffer to the planet, so they can generate satellites
	
	number_of_planets = randi_range(1,5)
	print(number_of_planets)
	
	var orbit_segment_size: int = (safe_zone_outer-safe_zone_inner)/number_of_planets
	
	for i in number_of_planets:
		var orbit_inner_limit = safe_zone_outer + (orbit_segment_size*(i-1))
		var orbit_outer_limit = safe_zone_inner + (orbit_segment_size*i)
		
		var planet_distance = randi_range(orbit_inner_limit, orbit_outer_limit)
		
		var planet = planet_scene.instantiate()
		planet.distance = planet_distance
		planet.target = self
		add_child(planet)
