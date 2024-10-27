class_name Building extends Area2D

var collision: CollisionPolygon2D

func updateCollision(points: PackedVector2Array) -> void:
	collision = CollisionPolygon2D.new()
	collision.polygon = points
