using Godot;
using System;

public partial class resizeBackground : Sprite2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready() {
		var rect = GetViewportRect();

		Scale = rect.Size / Texture.GetSize();
	}

}
