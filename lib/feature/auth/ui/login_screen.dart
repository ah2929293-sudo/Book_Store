import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_app_bar.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/localization/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Welcome back! Glad to see you, Again!",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                  ),
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
                  isPassword: true,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(fontSize: 14.sp, color: Colors.blueGrey),
                  ),
                ),
                SizedBox(height: 30.h),
                AppButton(
                  title: LocaleKeys.login.tr(),
                  onTap: () async {
                    await login();
                  },
                ),
                SizedBox(height: 30.h),
                Divider(color: Colors.grey, thickness: 1),
                SizedBox(height: 30.h),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.images.googleIc),
                      SizedBox(width: 12),

                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.images.cibApple),
                      SizedBox(width: 12),

                      Text(
                        "Sign in with Apple",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
