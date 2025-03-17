extends Node
class_name AnimationComponent

@export_group("Nodes")
@export var sprite: Sprite2D
@export var anim_player: AnimationPlayer

func handle_facing_horizontal_direction(direction: float) -> void:
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false

func handle_movement_animation(body: CharacterBody2D) -> void:
	if anim_player.is_playing() and anim_player.current_animation == "attack":
		return

	if body.velocity != Vector2.ZERO:
		anim_player.play("run")
	else:
		anim_player.play("idle")

func handle_attack_animation(is_attacking: bool) -> void:
	if is_attacking:
		anim_player.play("attack")