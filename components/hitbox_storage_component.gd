extends Node2D
class_name HitboxStorageComponent

@export_group("Nodes")
@export var hitbox_generators: Array[Node2D] ## Nodes which emit the "spawn_hitbox" signal send their hitboxes to this component

func _ready() -> void:
    for generator in hitbox_generators:
        generator.spawn_hitbox.connect(_on_spawn_hitbox)

func _on_spawn_hitbox(hitbox: HitboxComponent):
    add_child(hitbox)