extends RigidBody2D
class_name car

onready var front_wheel := $FrontWheel
onready var back_wheel := $BackWheel
onready var car_hit := $CarHit

export(float) var wheel_torque : float = 50000
export(float) var torque : float = 10000

func _physics_process(delta : float) -> void:
	var horizontal := Input.get_action_strength("right") - Input.get_action_strength("left")
#	wheel.set_applied_force(wheel_torque * gas)
	if not front_wheel.get_colliding_bodies() or not back_wheel.get_colliding_bodies():
		set_applied_torque(torque * horizontal)
		
	front_wheel.set_applied_torque(wheel_torque * horizontal)
	back_wheel.set_applied_torque(wheel_torque * horizontal)


func _on_Car_body_entered(body):
	car_hit.play()
