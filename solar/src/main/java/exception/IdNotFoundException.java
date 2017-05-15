package exception;

public class IdNotFoundException extends RuntimeException{
	private static final long serialVersionUID = -3400457764253986392L;
	public IdNotFoundException() {}
	public IdNotFoundException(RuntimeException e){
		super(e);
	}
	
}
