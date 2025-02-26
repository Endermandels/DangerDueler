extends StateComponent
class_name IdleState

@export_group("Nodes")
@export var timer: Timer

@export_group("Settings")
@export var idle_time_max: float = 1.5
@export var idle_time_min: float = 1.0

func _ready() -> void:
    timer.timeout.connect(_on_timer_timeout)

func enter() -> void:
    timer.wait_time = randf_range(idle_time_min, idle_time_max)
    timer.start()

func _on_timer_timeout():
    transitioned.emit(self, "wanderstate")