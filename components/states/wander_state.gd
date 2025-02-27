extends StateComponent
class_name WanderState


@export_group("Nodes")
@export var ai_component: AIComponent
@export var player_detector: Area2D
@export_subgroup("Internal")
@export var timer: Timer

@export_group("States")
@export var on_target_not_found_state: StateComponent ## Transition to this state when target is not found
@export var on_target_found: StateComponent ## Transition to this state when target is found

@export_group("Settings")
@export var wander_time_max: float = 1.0 
@export var wander_time_min: float = 0.5


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	player_detector.body_entered.connect(_on_player_detector_body_entered)

func enter() -> void:
	ai_component.set_move_vector(Vector2(randf() - 0.5, randf() - 0.5))
	timer.wait_time = clampf(randf_range(wander_time_min, wander_time_max), 0.0, INF)
	timer.start()

func _on_timer_timeout() -> void:
	transitioned.emit(self, on_target_not_found_state)

func _on_player_detector_body_entered(body: Node2D) -> void:
	timer.stop()
	ai_component.set_target(body)
	transitioned.emit(self, on_target_found)
