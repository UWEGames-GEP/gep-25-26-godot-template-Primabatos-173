extends Control
class_name Inventory

@export var items = []

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	#if Input.is_action_just_pressed("open inventory"):
		#Additem("item added")
		#print(items)
	if Input.is_action_just_pressed("Remove item"):
		Removeitem()
		print(items)

	
func _on_area_3d_area_entered(body: Node3D) -> void:
	if body.is_in_group("Item"):
		Additem(body.get_parent_node_3d().getItemName())
		
		
		#print(body.get_parent_node_3d().getItemName())
		
		body.get_parent_node_3d().queue_free()
		


func Additem(item):
	
	items.append(item)
	print(items)
	
#Z key
func Removeitem() -> void:
	var item = items[0]
	
	
func increase_inventory_size():
	pass
