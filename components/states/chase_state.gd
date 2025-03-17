extends StateComponent
class_name ChaseState

@export_group("Nodes")
@export var ai_component: AIComponent
@export var target_detector: TargetDetector

@export_group("Settings")
@export_range(0,1000) var attack_range: float = 0.0 ## How far out until switching to attack state

@export_group("States")
@export var on_target_exited_state: StateComponent ## Transition to this state when target exits the target_detector area
@export var on_target_in_melee_range_state: StateComponent ## When target enters melee range

func physics_update(_delta: float) -> void:
	if not target_detector.target:
		transitioned.emit(self, on_target_exited_state)
		return
	if on_target_in_melee_range_state and \
			target_detector.target.global_position.distance_to(ai_component.body.global_position) < attack_range:
		transitioned.emit(self, on_target_in_melee_range_state)
		return
	ai_component.move_towards(target_detector.target.global_position)
