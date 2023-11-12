class_name GameplayState
extends Node

# StringNames with the same value are the same object. As compared to Strings that are different
# objects and must do string comparison.
# Strings are automatically converted to StringNames if they are passed into 
# functions that use them as a parameter.

signal transition(next_state_name: StringName)

func on_enter() -> void:
	pass

func on_exit() -> void:
	pass
	
func on_update(delta: float) -> void:
	pass
	
func on_physics_update(delta: float) -> void:
	pass
