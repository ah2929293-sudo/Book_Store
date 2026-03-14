import 'package:book_store/core/routes/app_router.dart';
import 'package:book_store/feature/auth/ui/login_screen.dart';
import 'package:book_store/feature/auth/ui/register_screen.dart';
import 'package:book_store/feature/welcome/ui/widgets/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          fontFamily: "DM",
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
        home: WelcomeScreen(),
      ),
    );
  }
}
