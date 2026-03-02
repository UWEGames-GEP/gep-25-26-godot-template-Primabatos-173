extends Area3D
@export var inv: Inventory

func _on_area_entered(body: Node3D) -> void:
	if body.is_in_group("Item"):
		
		Additem("item")
		
		print(items)
		body.get_parent_node_3d().queue_free()
