extends CharacterBody2D
class_name Player

@export_group("Nodes")
@export var animation_component: AnimationComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var attack_component: AttackComponent

signal spawn_hitbox(hitbox: HitboxComponent)

func _ready() -> void:
	attack_component.spawn_hitbox.connect(_on_attack_component_spawn_hitbox)

func _physics_process(_delta: float) -> void:
	movement_component.handle_movement(self, input_component.input_vector)
	animation_component.handle_facing_horizontal_direction(input_component.input_vector.x)
	animation_component.handle_movement_animation(self)

	move_and_slide()

func _on_attack_component_spawn_hitbox(hitbox: HitboxComponent):
	spawn_hitbox.emit(hitbox)
