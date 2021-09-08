extends RigidBody2D

onready var raycast := $BulletPos/RayCast2D
onready var shot_delay := $ShotDelay
onready var bullet_pos := $BulletPos
onready var shot := $Shot

var Bullet := preload("res://Scenes/Objects/Bullet.tscn")

func _process(delta : float) -> void:
	if raycast.is_colliding() and raycast.get_collider().is_in_group("car") and shot_delay.is_stopped():
		shot_delay.start()
		shoot()


func shoot() -> void:
	shot.play()
	var bullet = Bullet.instance()
	bullet.position = bullet_pos.global_position
	bullet.dir = Vector2.LEFT.rotated(rotation)
	
	get_parent().add_child(bullet)
