extends Node
class_name InputComponent

## Normalized input vector
var input_vector: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
    var h_dir: float = Input.get_axis("move_left", "move_right");
    var v_dir: float = Input.get_axis("move_up", "move_down");

    input_vector = Vector2(h_dir, v_dir).normalized()
