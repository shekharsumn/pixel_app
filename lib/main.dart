import 'package:flutter/material.dart';
import 'package:one_cask/screens/home_screen.dart';
import 'package:one_cask/screens/signin_screen.dart';
import 'package:one_cask/screens/splash_screen.dart';
import 'app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Splash',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signin': (context) =>
            SignInScreen(),
        '/home': (context) =>
            HomeScreen(), // Replace with your actual home screen
      },
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
