extends Node2D

var pivot
var retract = false
var scale_ratio = Vector2(1, 1)

func _ready():
	pivot = get_parent()
	
func _process(delta):
	if retract:
		if scale_ratio.x > 0:
			scale_ratio.x -= delta 
	else: 
		if scale_ratio.x < 1:
			scale_ratio.x += delta
	pivot.set_scale(scale_ratio)
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT:
			if !retract:
				retract = true
			else:
				retract = false
