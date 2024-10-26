using Godot;
using System;

public partial class Player : CharacterBody2D {
	[Export] public int speed = 300;

	[Export] public int maxHP = 100;
	[Export] public int currentHP = 100;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready() {
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta) {
		Vector2 input = Input.GetVector("left", "right", "up", "down");
		Velocity = input * speed;
		MoveAndSlide();

		if (Input.IsActionPressed("special")) {
			GD.Print("special");
		}
	}
}
