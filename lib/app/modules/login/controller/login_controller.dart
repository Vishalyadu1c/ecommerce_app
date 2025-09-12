import 'package:get/get.dart';

class LoginController extends GetxController {

// reactive variables and methods for login functionality can be added here
RxString email = ''.obs;
RxString password = ''.obs; 


RxBool isEmailTouched = false.obs;
RxBool isPasswordTouched = false.obs;

String? get emailError{
  if(email.value.isEmpty) return null;
  if(!isEmailTouched.value) return null;
  if(!GetUtils.isEmail(email.value)) return 'Enter a valid email address';
  return null;
}

String? get passwordError{
  if(password.value.isEmpty) return null;
  if(!isPasswordTouched.value) return null;
  if(password.value.length < 6) return 'Password must be at least 6 characters';
  return null;
}


void onEmailChanged(String email){
  if(email.isEmpty) isEmailTouched.value = true;
}

void onPasswordChanged(String password){
  if(password.isEmpty) isPasswordTouched.value = true;
}


}
