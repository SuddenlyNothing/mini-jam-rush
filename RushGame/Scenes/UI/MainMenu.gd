extends Control

export(String, FILE, "*.tscn") var credits
export(String, FILE, "*.tscn") var play



func _on_Credits_pressed():
	Global.goto_scene(credits)


func _on_Play_pressed():
	Global.goto_scene(play)
