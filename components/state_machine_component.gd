extends Node
class_name StateMachineComponent

@export_group("Nodes")
@export var current_state: StateComponent = null

var __states: Dictionary = {}

func _ready() -> void:
	for state: StateComponent in get_children():
		__states[state.name.to_lower()] = state
		state.transitioned.connect(_on_state_transitioned)
	current_state.enter()

func _on_state_transitioned(_from: StateComponent, to: String):
	to = to.to_lower()
	if not to in __states:
		return

	__states[to].enter()
	current_state = __states[to]

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
