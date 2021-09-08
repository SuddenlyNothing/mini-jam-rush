extends Node

onready var car_surf := $CarSurf
onready var wanna_fast := $WannaFast

func play_track(num) -> void:
	match num:
		0:
			car_surf.stop()
			wanna_fast.stop()
		1:
			car_surf.stop()
			if wanna_fast.playing:
				return
			wanna_fast.play()
		2:
			wanna_fast.stop()
			if car_surf.playing:
				return
			car_surf.play()
