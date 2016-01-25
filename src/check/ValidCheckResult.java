package check;

public class ValidCheckResult {
	private final boolean isValid;
	private final String errorMessage;

	public ValidCheckResult(boolean isValid, String errorMessage){
		this.isValid = isValid;
		this.errorMessage = isValid ? null : errorMessage;
	}
	
	public boolean getIsValid(){
		return this.isValid;
	}
	public String getErrorMessage(){
		return this.errorMessage;
	}
}
