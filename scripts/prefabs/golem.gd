extends CharacterBody2D
class_name Golem

@export_group("Nodes")
@export var animation_component: AnimationComponent
@export var movement_component: MovementComponent
@export var ai_component: AIComponent

func _physics_process(_delta: float) -> void:
	movement_component.handle_movement(self, ai_component.move_vector)
	animation_component.handle_facing_horizontal_direction(velocity.x)
	animation_component.handle_movement_animation(self)

	move_and_slide()
