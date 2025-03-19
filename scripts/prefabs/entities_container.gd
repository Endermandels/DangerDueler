extends Node
class_name EntitiesContainer

## Spawns entities and hitboxes

@export_group("Nodes")
@export var hitbox_container: Node2D

func _ready():
    for child in get_children():
        for signal_dict: Dictionary in child.get_signal_list():
            if signal_dict.name == "spawn_hitbox":
                child.spawn_hitbox.connect(_on_node_spawn_hitbox)

func _on_node_spawn_hitbox(hitbox: HitboxComponent):
    hitbox_container.add_child(hitbox)