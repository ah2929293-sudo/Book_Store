import 'package:book_store/core/routes/routes.dart';
import 'package:book_store/feature/auth/ui/login_screen.dart';
import 'package:book_store/feature/auth/ui/register_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
    }
  }
}
