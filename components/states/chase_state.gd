extends StateComponent
class_name ChaseState

@export_group("Nodes")
@export var ai_component: AIComponent
@export var player_detector: Area2D

@export_group("States")
@export var on_target_exited: StateComponent ## Transition to this state when target exits the player_detector area

var body: Node2D ## The node that is chasing the target
var target: Node2D ## The node that is being chased by the body

func _ready() -> void:
	player_detector.body_exited.connect(_on_player_detector_body_exited)

func enter() -> void:
	body = ai_component.body
	target = ai_component.target

func physics_update(_delta: float) -> void:
	ai_component.set_move_vector(target.global_position - body.global_position)

func _on_player_detector_body_exited(exited_body: Node2D):
	if exited_body == target:
		ai_component.set_target(null)
		transitioned.emit(self, on_target_exited)
