extends Node

signal player_board_updated
signal opponent_board_updated

var _player_board: Board
var _opponent_board: Board

# Called when the node enters the scene tree for the first time.
func _ready():
	_player_board = Board.new()
	_opponent_board = Board.new()
	
func get_player_board():
	return _player_board

func get_opponent_board():
	return _opponent_board
	
func add_card_player_board(card: Card, x: int, y:int):
	_player_board.add_card_to_position(card, x, y)
	player_board_updated.emit()

func add_card_opponent_board(card: Card, x: int, y:int):
	_opponent_board.add_card_to_position(card, x, y)
	opponent_board_updated.emit()
