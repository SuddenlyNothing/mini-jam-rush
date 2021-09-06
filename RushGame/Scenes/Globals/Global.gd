extends Control

onready var fade := $CanvasLayer/Fade

var current_scene : Node
var previous_scene : String

func _ready() -> void:
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )


func goto_scene(path : String) -> void:
	get_tree().paused = true
	previous_scene = current_scene.filename
	fade.fade_out()
	yield(fade, "faded_out")
	call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path : String) -> void:
	# Immediately free the current scene,
	# there is no risk here.
	current_scene.free()

	# Load new scene
	var s = ResourceLoader.load(path)

	# Instance the new scene
	current_scene = s.instance()

	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)

	# optional, to make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene( current_scene )
	
	fade.fade_in()
	set_process(true)
	get_tree().paused = false


func restart_scene() -> void:
	goto_scene(current_scene.filename)
