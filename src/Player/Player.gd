extends KinematicBody2D
class_name Player

onready var state_machine: StateMachine = $StateMachine
onready var skin: Node2D = $Skin

onready var collider: CollisionShape2D = $CollisionShape2D

onready var hook: Hook = $Hook

onready var ledge_wall_detector: LedgeWallDetector = $LedgeWallDetector
onready var floor_detector: FloorDetector = $FloorDetector

onready var pass_through: Area2D = $PassThrough

# FLOOR NORMAL is a variable that affects which direction is the floor.
# Vector2.UP is a Vector2(0,-1) value. the -1 y value indicates that the top is up and the bottom is down.
# -1 is going up in Godot
# Places where you might need to use FLOOR_NORMAL is in functions like move_and_slide
const FLOOR_NORMAL: = Vector2.UP

# Gonna be automatically true when the Player node is created
var is_active = true setget set_is_active

func set_is_active(value: bool) -> void:
	is_active = value
	# Check if the Collider has not been set yet
	if not collider:
		return
	collider.disabled = not value	
