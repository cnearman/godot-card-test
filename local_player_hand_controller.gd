class_name HandController
extends Node

signal hand_cards_updated

var _cards = []

func _ready():
	var card1 = Card.new()
	card1.name = "Card 1"
	card1.cost = "1"
	_cards.push_back(card1)
	
	var card2 = Card.new()
	card2.name = "Card 2"
	card2.cost = "2"
	_cards.push_back(card2)
	
	var card3 = Card.new()
	card3.name = "Card 3"
	card3.cost = "3"
	_cards.push_back(card3)
	hand_cards_updated.emit()

func _process(_delta):
	pass

func getCardsInHand():
	return _cards

func add_card_to_hand(card: Card):
	_cards.push_back(card)
	hand_cards_updated.emit()
