extends Node2D
class_name Main # TODO think

var loaded_scenes_map: Dictionary = {}
var level_instance


func _ready():
	print("main ready")
	Global.main = self
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	var sceneMetedata = SceneMetadata.new()
	sceneMetedata.scene_name = "MainMenu"
	sceneMetedata.scene_type = SceneMetadata.MENU_TYPE
	load_level(sceneMetedata)

func unload_level(sceneMetadata: SceneMetadata):
	# var scene: SceneTree = loaded_scenes_map.get(sceneMetadata.scene_name) # todo rework
	# if (is_instance_valid(scene)):
	# 	scene.queue_free()
	# loaded_scenes_map.erase(sceneMetadata.scene_name)
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null
	

func load_level(sceneMetadata: SceneMetadata):
	unload_level(sceneMetadata) 
	var folder = sceneMetadata.scene_type
	var level_path = "res://scenes/" + folder + "/%s.tscn" % sceneMetadata.scene_name
	print(level_path)
	var level_resource = load(level_path)
	if (level_resource):
		print(level_resource)
		level_instance = level_resource.instantiate()
		self.add_child(level_instance)


# Creates new scene from tscn_path and attaches it to parent 
func load_new_scene(parent: Node2D, tscn_path: String) -> Variant:
	var tscn_instance
	var tscn_resource = load(tscn_path)
	if (tscn_resource):
		tscn_instance = tscn_resource.instantiate()
		parent.add_child(tscn_instance)
	return tscn_instance


