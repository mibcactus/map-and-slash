using Godot;
using System;

public partial class ChangeSceneButton : Button
{
	[Export]
	public string ScenePath = "add me!";
	
	private void ButtonPressed(){
		//GD.Print("hello world");
		//GD.Print("Next scene is: " + ScenePath);
		
		GetTree().ChangeSceneToFile(ScenePath);
	}
	
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print("hi");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
