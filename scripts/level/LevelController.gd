extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = Global.main.load_new_scene(self, "res://scenes/player/Player.tscn")
	Global.player = player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
