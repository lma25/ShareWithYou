package check;

public class ValidCheck {
	public static String validUserName(){
		return "Valid UserName contains 4 ~ 16 characters of A ~ Z, a ~ z, 0 ~ 9, @, ., and _.";
	}
	public static ValidCheckResult isValidUserName(String s){
		if(s == null){
			return new ValidCheckResult(false, "No UserName input.");
		}else if(s.length() < 4 || s.length() > 16){
			return new ValidCheckResult(false, "The length of UserName should be 4 ~ 16.");
		}
		for(int i = 0; i < s.length(); ++i){
			char c = s.charAt(i);
			if(c == '@' || c == '.' || c == '_' || (c >= '0' && c <= '9')
			|| (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')){
				continue;
			}
			return new ValidCheckResult(false, "UserName should only contains A ~ Z, a ~ z, 0 ~ 9, @, ., and _.");
		}
		return new ValidCheckResult(true, null);
	}
	public static String validPassword(){
		return "Valid Password contains 8 ~ 16 characters of A ~ Z, a ~ z, 0 ~ 9, !, #, and &.";
	}
	public static ValidCheckResult isValidPassword(String s){
		if(s == null){
			return new ValidCheckResult(false, "No Password input.");
		}else if(s.length() < 8 || s.length() > 16){
			return new ValidCheckResult(false, "The length of Password should be 8 ~ 16.");
		}
		for(int i = 0; i < s.length(); ++i){
			char c = s.charAt(i);
			if(c == '!' || c == '#' || c == '&' || (c >= '0' && c <= '9')
			|| (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')){
				continue;
			}
			return new ValidCheckResult(false, "UserName should only contains A ~ Z, a ~ z, 0 ~ 9, @, ., and _.");
		}
		return new ValidCheckResult(true, null);
	}
}
