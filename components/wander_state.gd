extends StateComponent
class_name WanderState

@export_group("Nodes")
@export var timer: Timer
@export var input_component: InputComponent

@export_group("States")
@export var target_not_found_state: StateComponent ## Transition to this state when target is not found

@export_group("Settings")
@export var wander_time_max: float = 1.0 
@export var wander_time_min: float = 0.5

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func enter() -> void:
	input_component.set_input_vector(Vector2(randf() - 0.5, randf() - 0.5).normalized())
	timer.wait_time = clampf(randf_range(wander_time_min, wander_time_max), 0.0, INF)
	timer.start()

func _on_timer_timeout():
	input_component.set_input_vector(Vector2.ZERO)
	transitioned.emit(self, target_not_found_state)
