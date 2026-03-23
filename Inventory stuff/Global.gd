extends Node

var inventory = []

signal invUpdated

var player_node: Node = null

func _ready():
	inventory.resize(30)

func add_item():
	invUpdated.emit()
	

func remove_item():
	invUpdated.emit()

func increaseInvSize():
	invUpdated.emit()

func set_player_reference(player):
	player_node = player
