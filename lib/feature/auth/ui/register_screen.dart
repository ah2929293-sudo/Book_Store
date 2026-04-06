import 'package:book_store/core/routes/routes.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_arrow_back.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/feature/auth/cubit/auth_cubit.dart';
import 'package:book_store/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
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
                  controller: nameController,
                  hintText: "Username",
                  keyboardType: TextInputType.name,
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
                  controller: passwordConfirmationController,
                  hintText: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
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
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginScreen,
                      );
                    }
                  },
                  child: AppButton(
                    title: LocaleKeys.login.tr(),
                    onTap: () {
                      context.read<AuthCubit>().register(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        password_confirmation:
                            passwordConfirmationController.text,
                      );
                    },
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
