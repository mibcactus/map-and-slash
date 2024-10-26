
public class StateMachine {
    
    private State currentState;

    public StateMachine(State initialState) {
        currentState = initialState;
    }
    
    public void changeState(State newState) {
        currentState.finish();
        currentState = newState;
        currentState.enter();
    }

    public void update(double delta) {
        currentState.update(delta);
    }

    public void finish() {
        currentState.finish();
    }

    public string getStateName() {
        return currentState.name();
    }

}
