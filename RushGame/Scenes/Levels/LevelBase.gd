extends Node2D

export(int, "Nothing", "Track1", "Track2") var music := 0

func _ready() -> void:
	Music.play_track(music)


func _process(delta):
	if Input.is_action_just_pressed("restart"):
		Global.restart_scene()
