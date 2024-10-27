using Godot;
using System;

public partial class EntitySpawner : Node2D {

	[Export] private int amount = 1;
	[Export] private int rate = 500;
	[Export] private string entityPath;
	
	private DateTime timeOfLastSpawn;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta) {
		if (DateTime.Now > timeOfLastSpawn.AddMilliseconds(rate)) {
			timeOfLastSpawn = DateTime.Now;
			// spawn new thing
		}

	}
}
