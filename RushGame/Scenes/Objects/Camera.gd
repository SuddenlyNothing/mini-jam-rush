extends Camera2D

export(NodePath) var target_node_path setget set_target_node_path
var target_node

func _process(delta : float) -> void:
	if not target_node:
		return
	position.x = target_node_path.global_position.x


func set_target_node_path(val) -> void:
	target_node_path = target_node
	target_node = get_node(target_node_path)
