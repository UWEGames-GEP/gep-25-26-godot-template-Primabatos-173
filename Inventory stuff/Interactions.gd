extends Area3D

@export var ItemTypes : Array[Item] = []

var NearbyBodies : Array[InteractableItem]

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
				print("Item id:" + str(i) + "Item Name:" + ItemTypes[i].ItemName)
				return
			
		print("Item not found")
		

func OnObjectEnteredArea(body: Node3D):
	pickup()

func OnObjectExitedArea(body: Node3D):
	if(body is InteractableItem and NearbyBodies.has(body)):
		body.LoseFocus()
		NearbyBodies.remove_at(NearbyBodies.find(body))
