extends CharacterBody2D
class_name Golem

@export_group("Nodes")
@export var animation_component: AnimationComponent
@export var movement_component: MovementComponent

func _physics_process(_delta: float) -> void:
	movement_component.handle_movement(self, Vector2.ZERO)
	animation_component.handle_facing_horizontal_direction(0)
	animation_component.handle_movement_animation(self)

	move_and_slide()
