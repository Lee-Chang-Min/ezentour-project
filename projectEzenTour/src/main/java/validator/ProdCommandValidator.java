package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ProdCommandValidator implements Validator{
   public boolean supports(Class<?> clazz) {
      return false;
   }

   @Override
   public void validate(Object target, Errors errors) {
      ValidationUtils.rejectIfEmpty(errors, "prodName", "required");
      ValidationUtils.rejectIfEmpty(errors, "prodPrice", "required");
      ValidationUtils.rejectIfEmpty(errors, "maxPer", "required");
      ValidationUtils.rejectIfEmpty(errors, "prodLocation", "required");
      ValidationUtils.rejectIfEmpty(errors, "prodSDate", "required");
      ValidationUtils.rejectIfEmpty(errors, "prodEDate", "required");

   }
}