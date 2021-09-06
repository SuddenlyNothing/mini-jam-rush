extends Area2D

export(String, FILE, "*.tscn") var next_scene


func _on_Finish_body_entered(body):
	if body.is_in_group("car"):
		Global.goto_scene(next_scene)
