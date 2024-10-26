using Godot;
using System.Collections.Generic;

public partial class loadScores : VBoxContainer {
	[Export] private Theme theme;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		List<Score> scores = new List<Score>();
		
		// TODO: Add support for loading in saved scores
		
		scores.Add(new Score(543, "ALI"));
		scores.Add(new Score(300, "BOB"));
		scores.Add(new Score(223, "CAL"));
		
		
		scores.Sort();
		
		// find scores file
		
		int maxScores = scores.Count > 10 ? 10 : scores.Count;
		for (int i = 0; i < maxScores; i++) {
			string txt = (i+1) + ". " + scores[i].name + ": " + scores[i].score;
			GD.Print(txt);

			var label = new Label();
			label.SetText(txt);
			label.SetTheme(theme);
			AddChild(label);
		}
		
	}
}
