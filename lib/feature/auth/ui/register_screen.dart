import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_arrow_back.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/localization/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomArrowBack(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome back! Glad to see you, Again!",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: emailController,
                hintText: "Username",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Confirm Password",
                keyboardType: TextInputType.visiblePassword,
              ),

              SizedBox(height: 30.h),
              AppButton(
                title: LocaleKeys.register.tr(),
                onTap: () async {
                  await login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    Dio dio = Dio();
    final response = await dio.post(
      "https://codingarabic.online/api/login",
      data: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
  }
}
