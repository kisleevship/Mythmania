extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_path = "res://scenes/player/Player.tscn"
	var player_resource = load(player_path)
	if (player_resource):
		var player_instance = player_resource.instantiate()
		self.add_child(player_instance)
		Global.player = player_instance


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
