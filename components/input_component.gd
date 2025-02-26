extends Node
class_name InputComponent

@export_group("Settings")
@export var keyboard_input: bool = false

## Normalized input vector
var input_vector: Vector2 = Vector2.ZERO

func set_input_vector(dir: Vector2):
    input_vector = dir

func _process(_delta: float) -> void:
    if keyboard_input:
        var h_dir: float = Input.get_axis("move_left", "move_right");
        var v_dir: float = Input.get_axis("move_up", "move_down");

        input_vector = Vector2(h_dir, v_dir).normalized()
