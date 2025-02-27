extends StateComponent
class_name ChaseState

# @export_group("States")
# @export var on_target_out_of_sight: StateComponent

@export_group("Nodes")
@export var ai_component: AIComponent

var body: Node2D ## The node that is chasing the target
var target: Node2D ## The node that is being chased by the body

func enter() -> void:
	body = ai_component.body
	target = ai_component.target

func physics_update(_delta: float) -> void:
	print("updating")
	ai_component.set_move_vector(target.global_position - body.global_position)
