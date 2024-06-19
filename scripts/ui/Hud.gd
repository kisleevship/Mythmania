extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Hud = self


func _on_SpawnFootmanBtn_pressed():
	var player: Player = Global.player as Player
	#var spawn_coordinates: Vector2 = Global.player.find_child("SpawnerLocation").global_position
	var spawn_coordinates: Vector2 = player.spawnerLocation.global_position
	var loadedLevel = Global.loadedLevel
	var footman = Global.main.load_new_scene(loadedLevel, "res://scenes/unit/greek/Footman.tscn")
	footman.set_global_position(spawn_coordinates)

func _on_SpawnArcherBtn_pressed():
	print("Archer spawn called")
	
