extends Resource
class_name Item
@export var ItemName: String = ""
signal getName (ItemName)

func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("touch")
		getName.emit(ItemName)
