extends Area2D

var dir := Vector2(-1, 0)
var speed := 500
var damage = 0

var force := 500

func _ready() -> void:
	rotation = dir.angle()


func _physics_process(delta : float) -> void:
	position += dir * speed * delta
	


func _on_Bullet_body_entered(body):
	if body is RigidBody2D:
		body.apply_central_impulse(dir * force)
	queue_free()
