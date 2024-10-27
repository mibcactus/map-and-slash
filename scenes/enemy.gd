extends CharacterBody2D


const SPEED = 1



func _physics_process(delta: float) -> void:

	position = position.move_toward(get_parent().get_node("Player").position,SPEED)
	
	
	
	
