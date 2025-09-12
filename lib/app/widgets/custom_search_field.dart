import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_assets.dart';

class CustomSearchField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController?controller;
  final void Function()? onTap;
  final Widget?suffixIcon;
  final bool?autofocus;
  final bool?readOnly;
  const CustomSearchField({
    super.key,
     this.onChanged,
     this.controller,
     this.onTap,
     this.suffixIcon,
     this.autofocus,
     this.readOnly
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      autofocus: autofocus ?? false ,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? AppAssets.search2
              : AppAssets.search,
          width: 12.w,
          height: 12.h,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none
        ),
    
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.dark ? Colors.white12 : Colors.black12, width: 0.8),
        ),
        contentPadding: const EdgeInsets.only(top: 4.0,bottom: 4.0 ,right: 10.0).w,
      ),
    );
  }
}
