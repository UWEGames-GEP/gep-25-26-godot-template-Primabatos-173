extends Node3D
class_name InteractableItem

@export var ItemHighlight : MeshInstance3D

func GainFocus():
	ItemHighlight.visible = true

func LoseFocus():
	ItemHighlight.vivible = false
