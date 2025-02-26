extends Node
class_name StateMachineComponent

var current_state: State = null

func _ready() -> void:
    for state: State in get_children():
        state.exited.connect(_on_state_exited)

func _on_state_exited():
    pass

func _process(delta: float) -> void:
    current_state.update(delta)

func _physics_process(delta: float) -> void:
    current_state.physics_update(delta)