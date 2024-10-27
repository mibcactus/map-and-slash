using Godot;
using System;
using Godot.Collections;
using hacknotts.scripts;

public partial class Slot : TextureRect {
	[Export] private Item Item;
	[Export] private Item HintItem = null;
	
	[Signal] public delegate void ItemPickedEventHandler();

	public override void _Ready() {
		ItemPicked += () => GD.Print("Item Picked");
	}

	private void ItemPickedUp() {
		GD.Print("Item picked up");
	}
}
