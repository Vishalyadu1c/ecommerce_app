
import 'package:ecommerce_app/app/translation/app_translation_keys.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          AppTranslationKeys.appName: 'E-commerce App',
          AppTranslationKeys.signIn: 'Sign In',
          AppTranslationKeys.email: 'Email',
          AppTranslationKeys.password: 'Password',
          AppTranslationKeys.forgotPassword: 'Forgot Password?',
          AppTranslationKeys.signInWithGoogle: 'Sign In with Google',
          AppTranslationKeys.signInWithFacebook: 'Sign In with Facebook',
          AppTranslationKeys.signInWithApple: 'Sign In with Apple',
          AppTranslationKeys.signUpTitle:'Create Account',
          AppTranslationKeys.signUp:'Sign Up',
          AppTranslationKeys.forgotPasswordTitle:'Forgot Password',
          AppTranslationKeys.forgotPasswordBtnText:'Continue',
          AppTranslationKeys.welcomeMessage: 'Welcome to our E-commerce App',
          AppTranslationKeys.cart: 'Cart',
          AppTranslationKeys.checkout: 'Checkout',
          AppTranslationKeys.catText: 'Shop by categories'
          // Add more translations as needed
        },
        'hi': {
          AppTranslationKeys.appName: 'ई-कॉमर्स ऐप',
          AppTranslationKeys.signIn: 'साइन इन करें',
          AppTranslationKeys.email: 'ईमेल',
          AppTranslationKeys.password: 'पासवर्ड',
          AppTranslationKeys.forgotPassword: 'पासवर्ड भूल गए?',
          AppTranslationKeys.signInWithGoogle: 'गूगल से साइन इन करें',
          AppTranslationKeys.signInWithFacebook: 'फेसबुक से साइन इन करें',
          AppTranslationKeys.signInWithApple: 'एप्पल से साइन इन करें',
          AppTranslationKeys.signUpTitle: '',
          AppTranslationKeys.signUp:'',
          AppTranslationKeys.forgotPasswordTitle:'',
          AppTranslationKeys.forgotPasswordBtnText:'',
          AppTranslationKeys.welcomeMessage: 'हमारे ई-कॉमर्स ऐप में आपका स्वागत है',
          AppTranslationKeys.cart: 'कार्ट',
          AppTranslationKeys.checkout: 'चेकआउट',
          AppTranslationKeys.catText:''
          // Add more translations as needed
        },
      };
}


