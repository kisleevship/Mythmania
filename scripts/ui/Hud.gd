extends Node2D


func _ready():
	Global.Hud = self


func _on_SpawnFootmanBtn_pressed():
	var player: Player = Global.player as Player
	#var spawn_coordinates: Vector2 = Global.player.find_child("SpawnerLocation").global_position
	var spawn_coordinates: Vector2 = player.spawnerLocation.global_position
	var loadedLevel = Global.loadedLevel
	var footman: BasicUnit = Global.main.load_new_scene(loadedLevel, "res://scenes/unit/greek/Footman.tscn") as BasicUnit
	#footman.collisionShape.shape.get_rect()
	calculate_spawn_coordinates(player, footman)


func _on_SpawnArcherBtn_pressed():
	print("Archer spawn called")
	

func calculate_spawn_coordinates(player: Player, basicUnit: BasicUnit):
	var unitSize: Vector2 = basicUnit.collisionShape.shape.get_rect().size
	var spawn_coordinates: Vector2 = player.spawnerLocation.global_position
	basicUnit.set_global_position(spawn_coordinates)

	for someCollider in player.spawnZoneCollisionsMap.values():
		var someColliderSize: Vector2 = someCollider.collisionShape.shape.get_rect().size
		#if Geometry2D.segment_intersects_segment(basicUnit.global_position, unitSize, someCollider.global_position, someColliderSize):
		#if basicUnit.collisionShape.shape.collide(basicUnit.transform, someCollider.collisionShape, someCollider.transform):
		if intersection(basicUnit.global_position, unitSize, someCollider.global_position, someColliderSize):	
			print("spawn not possible unit=" + str(basicUnit) + ", collider=" + str(someCollider))
			basicUnit.queue_free()


func intersection(a_pos: Vector2, a_size: Vector2, b_pos: Vector2, b_size: Vector2):
	var a1: Vector2 = a_pos
	var a2: Vector2 = a_pos + a_size
	var b1: Vector2 = b_pos
	var b2: Vector2 = b_pos + b_size
	var x1 = max(min(a1.x, a2.x), min(b1.x, b2.x))
	var y1 = max(min(a1.y, a2.y), min(b1.y, b2.y))
	var x2 = min(max(a1.x, a2.x), max(b1.x, b2.x))
	var y2 = min(max(a1.y, a2.y), max(b1.y, b2.y))
	if x1 < x2 and y1 < y2:
		return true
	return false
	
