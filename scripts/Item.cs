using Godot;

namespace hacknotts.scripts;

public partial class Item : TextureRect {

	[Export] private string ItemName;
	[Export] private Texture ItemIcon;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready() {
		AddToGroup("items", true);
	}
}