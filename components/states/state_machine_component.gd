extends Node
class_name StateMachineComponent

@export_group("Nodes")
@export var current_state: StateComponent = null

## Connect all states' transitioned signal to the transition handler function.
## Enter into the current state
func _ready() -> void:
	for state: StateComponent in get_children():
		state.transitioned.connect(_on_state_transitioned)
	current_state.enter()

## Transitions from one state to another.
## Only allows the current state to transition
func _on_state_transitioned(from: StateComponent, to: StateComponent):
	if not to:
		push_warning("No state to transition to from: %s" % [from.name])
		return
	if from != current_state:
		push_warning("Not current State transition: %s to %s" % [from.name, to.name])
		return
	to.enter()
	current_state = to

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
