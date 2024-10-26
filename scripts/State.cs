public abstract class State {
    public abstract void enter();
    public abstract void update(double delta);
    public abstract void finish();
    
    public abstract string name();

}
