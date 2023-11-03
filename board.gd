class_name Board
extends Object

var _positions = [[Card.blank_card, Card.blank_card, Card.blank_card],
				 [Card.blank_card, Card.blank_card, Card.blank_card],
				 [Card.blank_card, Card.blank_card, Card.blank_card]]

func get_card_at_position(x: int, y: int):
	return _positions[x][y]

func add_card_to_position(card:Card, x: int, y: int):
	_positions[x][y] = card
