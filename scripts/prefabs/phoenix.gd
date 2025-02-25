extends CharacterBody2D
class_name Phoenix

@export_group("Nodes")
@export var animation_component: AnimationComponent

func _physics_process(_delta: float) -> void:
    animation_component.handle_facing_horizontal_direction(0)
    animation_component.handle_movement_animation(self)

    move_and_slide()