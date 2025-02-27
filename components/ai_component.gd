extends Node
class_name AIComponent

@export_group("Nodes")
@export var body: CharacterBody2D ## Body associated with this AI Component

var move_vector: Vector2 = Vector2.ZERO ## Normalized input vector
var target: Node2D ## Target for chasing

func set_move_vector(dir: Vector2):
    move_vector = dir.normalized()

func set_target(new_target: Node2D):
    target = new_target
