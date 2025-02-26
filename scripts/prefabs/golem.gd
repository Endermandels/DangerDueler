extends CharacterBody2D
class_name Golem

@export_group("Nodes")
@export var animation_component: AnimationComponent
@export var movement_component: MovementComponent
@export var input_component: InputComponent

func _physics_process(_delta: float) -> void:
	movement_component.handle_movement(self, input_component.input_vector)
	animation_component.handle_facing_horizontal_direction(0)
	animation_component.handle_movement_animation(self)

	move_and_slide()
