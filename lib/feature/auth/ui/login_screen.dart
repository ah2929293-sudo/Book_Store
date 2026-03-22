import 'package:book_store/core/routes/routes.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_arrow_back.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/feature/auth/cubit/auth_cubit.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/localization/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: CustomArrowBack(),
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
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is AuthErrorState) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text("Somehing Wrong Please try again"),
                        ),
                      );
                    } else if (state is AuthSuccessState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.BottomNavBarScreen,
                        (route) => false,
                      );
                    }
                  },
                  child: AppButton(
                    title: LocaleKeys.login.tr(),
                    onTap: () {
                      context.read<AuthCubit>().login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
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
}



//هعمل صفحه تانيه للسونر ف ويدجت ف الاوس 
