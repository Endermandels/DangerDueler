extends Area2D
class_name HitboxComponent

@export_group("Nodes")
@export_subgroup("Internal")
@export var duration_timer: Timer = null ## How long after the hitbox stops moving until the hitbox dies
@export var collision_shape: CollisionShape2D = null

@export_group("Settings")
@export var damage: float = 0.0 ## TODO: Change to Effect before starting battle
@export var speed: float = 0.0 ## Hitbox speed
@export var travel_distance: float = 0.0 ## How far the hitbox travels
@export var direction: Vector2 = Vector2.ZERO ## Which direction the hitbox should travel in

var distance_traveled: float = 0.0 ## How far the projectile has traveled

func _ready() -> void:
	if duration_timer:
		duration_timer.timeout.connect(_on_duration_timer_timeout)

func _physics_process(_delta: float) -> void:
	if speed > 0:
		if distance_traveled >= travel_distance:
			speed = 0
		distance_traveled += global_position.distance_to(global_position + direction*speed)
		global_position = global_position + direction*speed
	elif not duration_timer:
		queue_free()
	elif duration_timer.is_stopped():
		duration_timer.start()

func _on_duration_timer_timeout() -> void:
	queue_free()
