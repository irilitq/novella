extends Node

var main = "main"

func _ready() -> void:
	if main == "main":
		get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
