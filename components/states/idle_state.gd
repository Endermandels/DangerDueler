extends StateComponent
class_name IdleState

@export_group("Nodes")
@export var ai_component: AIComponent
@export var player_detector: Area2D
@export_subgroup("Internal")
@export var timer: Timer

@export_group("States")
@export var on_idle_finished_state: StateComponent ## Transition to this state when done idling
@export var on_target_found: StateComponent ## Transition to this state when target is found

@export_group("Settings")
@export var idle_time_max: float = 1.5
@export var idle_time_min: float = 1.0



func _ready() -> void:
    timer.timeout.connect(_on_timer_timeout)
    player_detector.body_entered.connect(_on_player_detector_body_entered)

func enter() -> void:
    ai_component.set_move_vector(Vector2.ZERO)
    timer.wait_time = randf_range(idle_time_min, idle_time_max)
    timer.start()

func _on_timer_timeout():
    transitioned.emit(self, on_idle_finished_state)

func _on_player_detector_body_entered(body: Node2D):
    timer.stop()
    ai_component.set_target(body)
    transitioned.emit(self, on_target_found)