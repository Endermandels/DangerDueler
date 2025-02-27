extends Node
class_name StateComponent

## Called to transition from a state to another state.
## If called from a state which is not the current state, it is ignored.
signal transitioned(from: StateComponent, to: StateComponent)

func enter() -> void:
    pass

func update(delta: float) -> void:
    pass

func physics_update(delta: float) -> void:
    pass