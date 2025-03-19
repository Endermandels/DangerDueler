extends Node
class_name AIComponent

## This class helps carry information across states and provides access to the NPC's body

@export_group("Nodes")
@export var body: CharacterBody2D ## Body associated with this AI Component

var move_vector: Vector2 = Vector2.ZERO ## Normalized input vector
var attack_vector: Vector2 = Vector2.ZERO ## Normalized attack vector
var is_attacking: bool = false ## Whether the NPC is attacking

func move_towards(vec: Vector2):
    move_vector = body.global_position.direction_to(vec)

func stop_moving():
    move_vector = Vector2.ZERO
