import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/login/controller/login_controller.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/app/translation/app_translation_keys.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  AppTranslationKeys.signIn.tr,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14.sp),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email Address'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.FORGOT_PASSWORD),
                  child: Text(
                    AppTranslationKeys.forgotPassword.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.lightThemePrimaryColour),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.DASHBOARD);
                    },
                    child: Text(
                      AppTranslationKeys.signIn.tr.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.lightThemeWhiteColour),
                    )),
                SizedBox(
                  height: 8.0.h,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.titleSmall),
                      TextSpan(
                          text: 'Sign Up',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightThemePrimaryColour,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoutes.REGISTER);
                            })
                    ])),
                SizedBox(
                  height: 80.h,
                ),
                CustomButton(
                    img: Theme.of(context).brightness == Brightness.dark ? AppAssets.apple2 : AppAssets.apple, label: 'Continue with Apple'),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                    img: AppAssets.google, label: 'Continue with Google'),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                    img: AppAssets.facebook, label: 'Continue with facebook'),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final String img;
  const CustomButton({super.key, required this.label, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.only(left: 20, right: 40).w,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          Image.asset(
            img,
            width: 40.w,
            height: 40.h,
          ),
          Expanded(
              child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
