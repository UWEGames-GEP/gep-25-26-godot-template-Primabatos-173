extends Area3D
signal OnItemPickedUp(item)
@export var ItemTypes : Array[ItemData] = []

var NearbyBodies : Array[InteractableItem]

func _input(event: InputEvent)-> void:
	#if(event.is_action_pressed("collect item")):
	#	pickup()
	pass


func pickup():
	var nearestItem : InteractableItem = null
	var nearestItemDistance : float = INF
	for item in NearbyBodies:
		if (item.global_position.distance_to(global_position) < nearestItemDistance):
			nearestItemDistance = item.global_position.distance_to(global_position)
			nearestItem = item
	
	if (nearestItem != null):
		nearestItem.queue_free()
		NearbyBodies.remove_at(NearbyBodies.find(nearestItem))
		var itemPrefab = nearestItem.scene_file_path
		for i in ItemTypes.size():
			if (ItemTypes[i].ItemModelPrefab != null and ItemTypes[i].ItemModelPrefab.resource_path == itemPrefab):
				print(ItemTypes[i].ItemName)
				OnItemPickedUp.emit(ItemTypes[i])
				return
			
		print("Item not found")
		

func OnObjectEnteredArea(body: Node3D):
	if (body is InteractableItem):
		print ("there")
		NearbyBodies.append(body)
		pickup()
