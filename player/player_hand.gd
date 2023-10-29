extends Node2D

@export var hand_controller: HandController
@export var card_template: PackedScene

@export var card_offset: float

var _card_renderers : Array[Node2D] = []

func _ready():
	print_debug("player_hand ready")
	render_hand()

func render_hand():
	hand_controller = get_node(NodePaths.hand_controller_path)
	var _cards = hand_controller.getCardsInHand()
	
	reset_hand()
	
	var num_of_cards = len(_cards)
	
	print_debug("player_hand::render_hand | rendering hand with {count} cards".format({"count": num_of_cards}))
	for i in range(num_of_cards):
		var current_card = _cards[i]
		#TODO: could change this to be from an object pool instead of creating a bunch of them at different times.
		var card_renderer = card_template.instantiate()
		
		var x_position = (i - num_of_cards / 2) * card_offset
		x_position = x_position + (1 - (num_of_cards % 2)) * (card_offset / 2)
		
		card_renderer.position = Vector2(x_position, 0)
		card_renderer.initialize(current_card)
		self.add_child(card_renderer)
		
		_card_renderers.push_back(card_renderer)

func reset_hand():
	for renderer in _card_renderers:
		renderer.queue_free()
	
	_card_renderers.clear()
