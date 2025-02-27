extends StateComponent
class_name ChaseState

@export_group("Nodes")
@export var ai_component: AIComponent
@export var target_detector: TargetDetector

@export_group("States")
@export var on_target_exited_state: StateComponent ## Transition to this state when target exits the target_detector area

func physics_update(_delta: float) -> void:
	if not target_detector.target:
		transitioned.emit(self, on_target_exited_state)
		return
	ai_component.move_towards(target_detector.target.global_position)
