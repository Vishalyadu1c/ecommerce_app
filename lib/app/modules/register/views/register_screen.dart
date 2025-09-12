import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/app/translation/app_translation_keys.dart';
import 'package:ecommerce_app/app/widgets/custom_back_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                AppTranslationKeys.signUpTitle.tr,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(hintText: 'First Name'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(hintText: 'Last Name'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(hintText: 'Email Adrress'),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(hintText: 'Contect Number'),
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
                height: 50.h,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppTranslationKeys.signUp.tr.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.lightThemeWhiteColour),
                  )),
              SizedBox(
                height: 5.0.h,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.titleSmall),
                    TextSpan(
                        text: 'Sign In',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightThemePrimaryColour),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offNamed(AppRoutes.LOGIN);
                          })
                  ]))
            ],
          ),
        ),
      )),
    );
  }
}


