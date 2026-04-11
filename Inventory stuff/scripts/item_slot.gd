extends Control
class_name ItemSlot

signal dropItem(fromSlotID, toSlotID)
#signal dropItem(ItemData)

@export var iconSlot : TextureRect

var slotID = -1
var slotFilled : bool = false

var slotData : ItemData

#function to fill the slot
func fillSlot(data : ItemData):
	slotData = data
	if(slotData != null):
		slotFilled = true
		iconSlot.texture = data.Icon
	else: 
		slotFilled = false
		iconSlot.texture = null

func removeItem(data : ItemData):
	if (slotFilled == true):
		slotFilled = false
		iconSlot.texture = null
		return slotFilled

#func getSlotData():
	#if (slotFilled):
		#return {"Type": "Item", "ID": slotID}
func _get_drag_data(at_position: Vector2)->Variant:
	if(slotFilled):
		var preview : TextureRect = TextureRect.new()
		preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		preview.size = iconSlot.size / 2.0
		preview.pivot_offset = iconSlot.size / 2.0
		preview.rotation = 2.0
		preview.texture = iconSlot.texture
		set_drag_preview(preview)
		
		return{"Type": "Item", "ID": slotID}
	else:
		return false

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data["Type"] == "Item"
#func _drop_data(at_position: Vector2, data: Variant) -> void:
	#OnItemDropped.emit(data["ID"], slotID)

func _drop_data (at_position: Vector2, data: Variant) -> void:
	dropItem.emit(data["ID"], slotID)

#func _on_pressed():
	#print(slotFilled)
	#.emit(ItemData)
	
