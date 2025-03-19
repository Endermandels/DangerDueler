extends Node
class_name EntitiesContainer

## Spawns entities and hitboxes

@export_group("Nodes")
@export var hitbox_container: Node2D

func _ready():
    SignalBus.spawn_hitbox.connect(_on_spawn_hitbox)

func _on_spawn_hitbox(hitbox: HitboxComponent):
    hitbox_container.add_child(hitbox)