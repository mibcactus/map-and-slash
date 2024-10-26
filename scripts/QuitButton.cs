using Godot;
using System;

public partial class QuitButton : Button
{
	public void _on_quit_pressed(){
		GD.Print("quitting...");
		GetTree().Quit();
	}
}
