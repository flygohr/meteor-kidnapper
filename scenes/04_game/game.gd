extends Node2D

func _ready() -> void:	
	GameData.is_in_game = true
	GameData.initiate_load_game_data()
	GameData.current[GameData.KEY_IS_NEW_GAME] = false
	GameData.initiate_save_game_data()
