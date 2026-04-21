extends Control
class_name Inv_UI

@export var PlayerBody : CharacterBody3D
@export_flags_3d_physics var CollisionMask : int
@export var slotCount = 20

@export var grid : GridContainer
@export var slotPrefab : PackedScene = preload("res://Inventory stuff/item_slot.tscn")

var invSlots : Array [ItemSlot] = []

var is_open = false

func _ready():
	close()
	for i in slotCount:
		var slot = slotPrefab.instantiate() as ItemSlot
		
		grid.add_child(slot)
		slot.slotID = i
		invSlots.append(slot)
		slot.dropItem.connect(droppedOnSlot.bind())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open inventory"):
		if is_open:
			close()
		else:
			open()

func pickup(item: ItemData):
	for slot in invSlots:
		if (!slot.slotFilled):
			slot.fillSlot(item)
			break

func drop(item: ItemData):
	for slot in invSlots:
		if(slot.slotFilled):
	
			break

func droppedOnSlot(fromSlotID : int, toSlotID : int):
	var toSlotItem = invSlots[toSlotID].slotData
	var fromSlotItem = invSlots[fromSlotID].slotData
	
	invSlots[toSlotID].fillSlot(fromSlotItem)
	invSlots[fromSlotID].fillSlot(toSlotItem)

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data["Type"] == "Item"

func _drop_data (at_position: Vector2, data: Variant) -> void:
	var newItem = invSlots[data["ID"]].slotData.ItemModelPrefab.instantiate() as Node3D
	
	invSlots[data["ID"]].fillSlot(null)
	PlayerBody.get_parent().add_child(newItem)
	newItem.global_position = getPlayerPosition()
	

func getPlayerPosition() -> Vector3:
	var currentpos = PlayerBody.global_transform.origin
	
	var forward = -PlayerBody.global_transform.basis.z
	var spawn_pos = currentpos +forward * -2 +Vector3.UP * 1.5
	return spawn_pos

#opens inventory
func open():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	is_open = true
	self.visible = true

#closes inventory
func close():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	visible = false
	is_open = false
