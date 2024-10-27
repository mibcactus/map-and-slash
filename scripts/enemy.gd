class_name Enemy extends CharacterBody2D

var SPEED = 1

	
	
func _physics_process(delta: float) -> void:
	position = position.move_toward(get_parent().get_parent().get_node("Player").position,SPEED)
	print(position[0] - get_parent().get_parent().get_node("Player").position[0])
	print(position)
	
	
	
	
