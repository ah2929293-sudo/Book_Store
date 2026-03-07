import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Color? backGroundColor;
  final String title;
  const AppButton({super.key, this.backGroundColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 19.h),
      decoration: BoxDecoration(
        border: backGroundColor == null
            ? null
            : Border.all(color: Colors.black),
        color: backGroundColor ?? AppColors.primaryColors,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          color: backGroundColor == null ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
