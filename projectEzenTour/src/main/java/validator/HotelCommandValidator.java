package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class HotelCommandValidator implements Validator {
	public boolean supports(Class<?> clazz) {
	      return false;
	   }

	   @Override
	   public void validate(Object target, Errors errors) {
	      ValidationUtils.rejectIfEmpty(errors, "hotelName", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelPrice", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelAddr", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelMealPrice", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelBedPrice", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelPh", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelRoomType", "required");
	      ValidationUtils.rejectIfEmpty(errors, "hotelContent", "required");  
	   }

}
