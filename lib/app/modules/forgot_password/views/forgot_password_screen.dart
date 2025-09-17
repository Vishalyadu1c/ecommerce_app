import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/translation/app_translation_keys.dart';
import 'package:ecommerce_app/app/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                AppTranslationKeys.forgotPasswordTitle.tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14.sp),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email Address',
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppTranslationKeys.forgotPasswordBtnText.tr.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.lightThemeWhiteColour),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
