using Godot;
using System;

public partial class Player : CharacterBody2D {
	[Export] public int speed = 300;

	[Export] public int maxHP = 100;
	[Export] public int currentHP = 100;

	private DateTime lastAction = DateTime.MinValue;
	private DateTime lastFootstep = DateTime.MinValue;

	private float timeBetweenActions = 0.5f;
	private float timeBetweenFootsteps = 0.5f;

	private bool hasTimePassed(DateTime started, double length) {
		return DateTime.Now > started.AddMilliseconds(length);
	}
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready() {
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta) {
		Vector2 input = Input.GetVector("left", "right", "up", "down");
		Velocity = input * speed;
		//MoveAndSlide();

		
		
		if (Input.IsActionPressed("special") && hasTimePassed(lastAction, timeBetweenActions)) {
			GD.Print("special");
			lastAction = DateTime.Now;
		}
		/* Change this to only run when footstep happens
		if (hasTimePassed(lastFootstep, timeBetweenFootsteps)) {
			var sfx = GetNode<AudioStreamPlayer>("SFX");
			sfx.Play();
			lastFootstep = DateTime.Now;
		}
		*/
		
		var collision = MoveAndCollide(Velocity * (float) delta);
		if (collision != null) {
			GD.Print("collision");
		}
	}
}
