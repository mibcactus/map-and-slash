using Godot;
using System;

/*
 * class_name Building extends Area2D

var collision: CollisionPolygon2D

func updateCollision(points: PackedVector2Array) -> void:
	collision = CollisionPolygon2D.new()
	collision.polygon = points

 */
public partial class Building : StaticBody2D {

	private void OnBodyEntered() {
		GD.Print("OnBodyEntered");
	}
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
