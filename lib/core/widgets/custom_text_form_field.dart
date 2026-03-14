import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  // ignore: prefer_typing_uninitialized_variables
  final isPassword;
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.isPassword = false,
    required this.hintText,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: AppColors.primaryColor,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && isObscure,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.all(8.r),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: isObscure
                      ? SvgPicture.asset(Assets.images.group)
                      : Icon(Icons.visibility_off),
                ),
              )
            : null,
        fillColor: AppColors.grayColor,
        filled: true,

        hintText: widget.hintText,
        hintStyle: AppTextStyle.hintStyle,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}

//58
