extends Node
class_name AttackComponent

# TODO: Specify option for Melee
# TODO: Specify option for Ranged

@export_group("Nodes")
@export var input_component: InputComponent
@export var body: Node2D ## Origination of the attack
@export var hitbox_component: PackedScene ## The projectile to spawn (extends HitboxComponent)

@export_group("Settings")

func _process(_delta: float) -> void:
	if input_component.should_attack:
		input_component.should_attack = false
		create_hitbox()

func create_hitbox() -> void:
	var hitbox: HitboxComponent = hitbox_component.instantiate()
	hitbox.direction = input_component.attack_vector
	hitbox.global_position = body.global_position
	SignalBus.spawn_hitbox.emit(hitbox)
