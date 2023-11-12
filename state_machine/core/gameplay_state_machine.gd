extends Node
class_name GameplayStateMachine

@export var initial_state: GameplayState
var states: Dictionary = {}
var current_state: GameplayState

func _ready():
	for child in get_children():
		if child is GameplayState:
			states[child.name] = child
			child.transition.connect()
		else:
			push_warning("Child of GameplayStateMachine is not GameplayState")
	
	current_state = initial_state
	current_state.on_enter()

func _process(delta):
	current_state.on_update(delta)
	
func _physics_process(delta):
	current_state.on_physics_update(delta)
	
func on_child_transitioned(next_state_name: StringName) -> void:
	var next_state = states.get(next_state_name)
	if next_state != null:
		current_state.on_exit()
		next_state.on_enter()
		current_state = next_state
	else:
		push_warning("Tried to transition to a state named %s that doesn't exist." % next_state_name)

# inital state will prepare game state
# Setup (Initialize player list)
# 
# player turn start
# player action plays
# player attack
# player action plays
# player turn end
