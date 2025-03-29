import 'package:flutter/material.dart';
import 'package:one_cask/screens/home_screen.dart';
import 'package:one_cask/screens/signin_screen.dart';
import 'screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
