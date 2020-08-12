extends Node
class_name StateMachine, "res://assets/icons/state_machine.svg"
"""
Generic State Machine. Initializes states and delegates engine callbacks to the active state.

"""

export var initial_state: = NodePath()

onready var state: State = get_node(initial_state) setget set_state

# Used for debugging, hence the internal variable
onready var _state_name = state.name

func _init() -> void:
	add_to_group("state_machine")

func _ready():
	yield(owner, "ready")
	state.enter()
	
func transition_to(target_state_path: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		return
	var target_state: = get_node(target_state_path)
	
	state.exit()
	self.state = target_state
	state.enter(msg)

func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input(event)

func _physics_process(delta: float) -> void:
	state.physics_process(delta)

func set_state(value: State) -> void:
	state = value
	_state_name = state.name
