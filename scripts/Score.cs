using System;

public class Score : IComparable<Score> {
	public readonly int score;
	public readonly string name;

	public Score(int score, string name) {
		this.score = score;
		this.name = name;
	}

	public int CompareTo(Score other) {
		if (score < other.score)
			return -1;
		
		return score == other.score ? 0 : 1;
	}
}
