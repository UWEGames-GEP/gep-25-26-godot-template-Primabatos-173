extends Control
class_name Inventory

@export var items = []

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Add item"):
		Additem("item added")

	
func Additem(itemName):
	items.append(itemName)
