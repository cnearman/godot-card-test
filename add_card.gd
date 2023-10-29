extends Node2D


func input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var new_card = Card.new()
		%local_player_hand_controller.add_card_to_hand(new_card)
