extends CharacterBody2D
class_name BasicUnit

@onready var collisionShape: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tree_exited():
	print("Unit died " + str(self))
