extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.main_menu = self
	print("main menu ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	var sceneMetadata = SceneMetadata.new()
	sceneMetadata.scene_name = "Level1"
	sceneMetadata.scene_type = SceneMetadata.LEVEL_TYPE
	Global.main.load_level(sceneMetadata) # TODO 

func _on_settings_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	pass # Replace with function body.


func _on_tree_exited():
	print("main menu closed")
