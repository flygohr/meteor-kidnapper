extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var textures: Array = [
	"res://assets/images/asteroids/a_01.png",
	"res://assets/images/asteroids/a_02.png",
	"res://assets/images/asteroids/a_03.png",
	"res://assets/images/asteroids/a_04.png",
	"res://assets/images/asteroids/a_05.png",
	"res://assets/images/asteroids/a_06.png",
	"res://assets/images/asteroids/a_07.png",
	"res://assets/images/asteroids/a_08.png",
	"res://assets/images/asteroids/a_09.png",
	"res://assets/images/asteroids/a_10.png",
	"res://assets/images/asteroids/a_11.png",
	"res://assets/images/asteroids/a_12.png",
	"res://assets/images/asteroids/a_13.png",
	"res://assets/images/asteroids/a_14.png",
	"res://assets/images/asteroids/a_15.png",
]

var angles: Array = [0, 90, 180, 270]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sprite_texture = load(textures.pick_random())
	sprite_2d.texture = sprite_texture
	rotate(deg_to_rad(angles.pick_random()))
