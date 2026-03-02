extends Control

var is_open = false

func _ready():
	close()

func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("open inventory"):
		#if is_open:
		#	close()
		#else:
		#	open()
	pass


func open():
	is_open = true
	self.visible = true

func close():
	visible = false
	is_open = false
