extends Control

onready var menu_button := $VBoxContainer/HBoxContainer/Menu

export(String, FILE, "*.tscn") var menu

var active := false

func _ready():
	hide()

func enter():
	if Global.current_scene.filename == menu:
		menu_button.hide()
	else:
		menu_button.show()
	show()
	get_tree().paused = true
	yield(get_tree(), "idle_frame")
	active = true

func exit():
	hide()
	get_tree().paused = false
	yield(get_tree(), "idle_frame")
	active = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and !active:
		enter()
	if Input.is_action_just_pressed("ui_cancel") and active:
		exit()

func _on_Back_pressed():
	exit()

func _on_Menu_pressed():
	exit()
	Global.goto_scene(menu)
