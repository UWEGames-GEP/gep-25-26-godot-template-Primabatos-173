extends Control
class_name Inventory

@export var items = []

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Add item"):
		Additem("item added")
		print(items)
	if Input.is_action_just_pressed("Remove item"):
		Removeitem("item added")
		print(items)
	

	
	
	
	

func Additem(itemName):
	items.append(itemName)

func Removeitem(itemName):
	items.erase(itemName)
