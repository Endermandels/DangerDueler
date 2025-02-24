extends Node2D
class_name World

var music_bus = AudioServer.get_bus_index("Master")

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("toggle_audio"):
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
