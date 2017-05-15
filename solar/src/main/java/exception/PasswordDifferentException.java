package exception;

public class PasswordDifferentException extends RuntimeException{
	private static final long serialVersionUID = 674940071912651953L;
	public PasswordDifferentException(){}
	public PasswordDifferentException(RuntimeException e){
		super(e);
	}
}