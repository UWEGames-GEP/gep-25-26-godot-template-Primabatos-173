extends Resource
class_name Inventory

@export var items: Array[Item]

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Add item"):
		Additem("item added")
		print(items)
	if Input.is_action_just_pressed("Remove item"):
		Removeitem("item added")
		print(items)
	
func _on_area_3d_area_entered(body: Node3D) -> void:
	if body.is_in_group("Item"):
		
		Additem("item")
		
		print(items)
		body.get_parent_node_3d().queue_free()
		
	
	
	
	
	
	
	

func Additem(itemName):
	
	items.append(itemName)

func Removeitem(itemName):
	items.erase(itemName)
