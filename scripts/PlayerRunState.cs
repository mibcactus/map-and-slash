using Godot;

namespace hacknotts.scripts;

public class PlayerRunState : State {
    PlayerData playerData;
    
    public PlayerRunState(PlayerData playerData) {
        this.playerData = playerData;
    }
    public override void enter() {
    }

    public override void update(double delta) {
        Vector2 input = Input.GetVector("left", "right", "up", "down");
        Vector2 velocity = input * playerData.speed;
        
        GD.Print(velocity);
    }

    public override void finish() {
    }

    public override string name() {
        return "PlayerRunState";
    }
}