extends Area3D
signal OnItemPickedUp(item)
signal OnItemDrop(item)

@export var ItemTypes : Array[ItemData] = []

var NearbyBodies : Array[InteractableItem]

func _input(event: InputEvent)-> void:
	
	pass

#when item enters player vacinity, the item will be deleted and emit a signal
func pickup():
	var detectedItem : InteractableItem = null
	for item in NearbyBodies:
		detectedItem = item
	
	if (detectedItem != null):
		detectedItem.queue_free()
		var itemPrefab = detectedItem.scene_file_path
		for i in ItemTypes.size():
			if (ItemTypes[i].ItemModelPrefab != null and ItemTypes[i].ItemModelPrefab.resource_path == itemPrefab):
				print(ItemTypes[i].ItemName)
				OnItemPickedUp.emit(ItemTypes[i])
				return


		

func OnObjectEnteredArea(body: Node3D):
	if (body is InteractableItem):
		NearbyBodies.append(body)
		pickup()
