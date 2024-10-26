using Godot;
using System;

public partial class ChangeSceneButton : Button
{
	[Export]
	public string ScenePath = "add me!";

	private void ChangeScenePressed() {
		GetTree().ChangeSceneToFile(ScenePath);
	}
}
