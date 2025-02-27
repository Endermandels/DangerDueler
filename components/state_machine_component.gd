extends Node
class_name StateMachineComponent

@export_group("Nodes")
@export var current_state: StateComponent = null

func _ready() -> void:
	for state: StateComponent in get_children():
		state.transitioned.connect(_on_state_transitioned)
	current_state.enter()

func _on_state_transitioned(_from: StateComponent, to: StateComponent):
	if not to or _from != current_state:
		return
	to.enter()
	current_state = to

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
