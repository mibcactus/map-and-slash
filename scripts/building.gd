class_name Building extends Area2D

var collision: CollisionPolygon2D

func updateCollision(points: PackedVector2Array) -> void:
	collision = CollisionPolygon2D.new()
	collision.polygon = points

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
