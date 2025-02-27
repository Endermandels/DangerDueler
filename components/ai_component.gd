extends Node
class_name AIComponent

@export_group("Nodes")
@export var body: CharacterBody2D ## Body associated with this AI Component

## Normalized input vector
var move_vector: Vector2 = Vector2.ZERO
var target: Node2D

func set_move_vector(dir: Vector2):
    move_vector = dir.normalized()

func set_target(new_target: Node2D):
    target = new_target
