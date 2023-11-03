extends Node2D

var dragging = false

var starting_position: Vector2;

func _unhandled_input(event):
	if event is InputEventMouseButton and not event.pressed and dragging:
		dragging = false
		position = starting_position
	if dragging and event is InputEventMouseMotion:
		position += event.relative
		
func input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("drag")
		starting_position = position
		dragging = true

func initialize(card: Card):
	self.name = card.name
	$MarginContainer/VBoxContainer/MarginContainer/name.text = card.name
	$MarginContainer/VBoxContainer/MarginContainer2/cost.text = str(card.cost)
