extends StateComponent
class_name IdleState

@export_group("Nodes")
@export var ai_component: AIComponent
@export var target_detector: TargetDetector
@export_subgroup("Internal")
@export var timer: Timer

@export_group("States")
@export var on_idle_finished_state: StateComponent ## Transition to this state when done idling
@export var on_target_found_state: StateComponent ## Transition to this state when target is found

@export_group("Settings")
@export var idle_time_max: float = 1.5
@export var idle_time_min: float = 1.0

func _ready() -> void:
    timer.timeout.connect(_on_timer_timeout)

func enter() -> void:
    ai_component.stop_moving()
    timer.wait_time = randf_range(idle_time_min, idle_time_max)
    timer.start()

func physics_update(_delta: float) -> void:
    if target_detector.target and not timer.is_stopped():
        handle_target_found()

func handle_target_found():
    timer.stop()
    transitioned.emit(self, on_target_found_state)

func _on_timer_timeout():
    transitioned.emit(self, on_idle_finished_state)