import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:book_store/localization/locale_keys.g.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(Assets.images.welcomeBackground.path).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == "ar") {
                      context.setLocale(Locale("en"));
                    } else if (context.locale.languageCode == "en") {
                      context.setLocale(Locale("ar"));
                    } else {
                      context.setLocale(Locale("en"));
                    }
                  },
                  icon: Icon(Icons.language),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            Assets.images.splash.image(),
            Expanded(
              child: Text(
                LocaleKeys.orderNow.tr(),
                style: TextStyle(fontFamily: "DM", fontSize: 20.sp),
              ),
            ),
            AppButton(title: LocaleKeys.login.tr()),
            SizedBox(height: 15.h),
            AppButton(
              backGroundColor: Colors.white,
              title: LocaleKeys.register.tr(),
            ),
            SizedBox(height: 94.h),
          ],
        ),
      ),
    );
  }
}
