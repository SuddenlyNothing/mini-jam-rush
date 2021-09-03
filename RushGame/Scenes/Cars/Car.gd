extends RigidBody2D
class_name car

onready var wheel := $Wheel
onready var wheel2 := $Wheel2

export(float) var wheel_torque : float = 1000
export(float) var torque : float = 5000

func _physics_process(delta : float) -> void:
	var horizontal := Input.get_action_strength("right") - Input.get_action_strength("left")
	set_applied_torque(torque * horizontal)
	var gas := Input.get_action_strength("space") - Input.get_action_strength("shift")
	wheel.set_applied_torque(wheel_torque * gas)
	wheel2.set_applied_torque(wheel_torque * gas)


func _on_Car_body_entered(body):
	pass # Replace with function body.
