extends StateComponent
class_name AttackState

@export_group("Nodes")
@export var ai_component: AIComponent
@export var animation_component: AnimationComponent
@export var target_detector: TargetDetector
@export var hitbox_component: PackedScene ## The projectile to spawn (extends HitboxComponent)

@export_group("States")
@export var on_attack_finished_state: StateComponent ## Transition to this state when done attacking

func _ready() -> void:
	animation_component.anim_player.animation_finished.connect(_on_animation_player_finished)

func _correct_facing() -> void:
	# Make sure the NPC is facing the correct direction
	if target_detector.target.global_position.x < ai_component.body.global_position.x and \
			not animation_component.sprite.flip_h:
		animation_component.sprite.flip_h = true
	elif target_detector.target.global_position.x > ai_component.body.global_position.x and \
			animation_component.sprite.flip_h:
		animation_component.sprite.flip_h = false

func enter() -> void:
	ai_component.is_attacking = true
	ai_component.stop_moving()
	ai_component.attack_vector = ai_component.body.global_position.direction_to(target_detector.target.global_position)
	_correct_facing()	

func create_hitbox() -> void:
	var hitbox: HitboxComponent = hitbox_component.instantiate()
	hitbox.direction = ai_component.attack_vector
	# TODO: change to dynamic spacing instead of 10 							  vv
	hitbox.global_position = ai_component.body.global_position + hitbox.direction*10 if not hitbox.is_ranged else Vector2.ZERO
	SignalBus.spawn_hitbox.emit(hitbox)

func _on_animation_player_finished(_anim_name: StringName) -> void:
	ai_component.is_attacking = false
	transitioned.emit(self, on_attack_finished_state)
