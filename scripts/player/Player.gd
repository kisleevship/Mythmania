extends CharacterBody2D
class_name Player

@export var ACCELERATION = 450
@export var FRICTION = 550
@export var MAX_SPEED = 110
@export var ROLL_SPEED = 150

@onready var canvasLayer = $CanvasLayer
@onready var spawnerLocation = $SpawnerLocation

enum {
	RUN,
	ROLL,
	JUMP
}

# TODO
#onready var animation_tree = $AnimationTree
#onready var animation_state = animation_tree.get("parameters/playback")

var roll_vector = Vector2.DOWN
var state = RUN
var roll_finished = false

func _ready():
	Global.player = self
	var hud = Global.main.load_new_scene(canvasLayer, "res://scenes/ui/Hud.tscn")
	Global.Hud = hud
	# animation_tree.active = true TODO
	

func _physics_process(delta):
	match state:
		RUN:	
			run_state(delta)
		#ROLL:
			#roll_state(delta)
			

func run_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		#animation_tree.set("parameters/Idle/blend_position", input_vector) TODO
		#animation_tree.set("parameters/Run/blend_position", input_vector)
		#animation_tree.set("parameters/Jump/blend_position", input_vector)
		#animation_tree.set("parameters/Roll/blend_position", input_vector)
		#animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		#animation_state.travel("Idle") TODO
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) # TODO check move_toward in godot 4

	move_and_slide()
	
	if velocity.length() > 0 && Input.is_action_just_pressed("roll"):
		state = ROLL
		roll_finished = false
	
#func roll_state(delta): TODO
	#if !roll_finished:
		#velocity = roll_vector * ROLL_SPEED
	#else:
		#velocity = velocity * 0.9
	#animation_state.travel("Roll")
	#velocity = move_and_slide(velocity)
