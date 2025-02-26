extends Node
class_name StateComponent

signal transitioned(from: StateComponent, to: StateComponent)

func enter() -> void:
    pass

func update(delta: float) -> void:
    pass

func physics_update(delta: float) -> void:
    pass