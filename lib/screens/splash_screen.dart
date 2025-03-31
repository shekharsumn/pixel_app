import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/styles/app_color.dart';
import 'package:one_cask/widgets/landing_drawer.dart';
import '../blocs/splashscreen/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _showLogo = true;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  bool _isDrawerVisible = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 3), () {
      showDrawer();
    });
  }

  void showDrawer() {
    if (mounted) {
      setState(() {
        _isDrawerVisible = true;
      });
      _fadeController.forward();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

 /*  void _handleOutsideTap() {
    if (_isDrawerVisible) {
      hideDrawer();
    } else {
      showDrawer();
    }
  } */

  void hideDrawer() {
    if (mounted) {
      setState(() {
        _isDrawerVisible = false;
      });
      _fadeController.reverse().then((_) {
        if (mounted) {
          setState(() {
            _showLogo = true;
          });
        }
      });
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocListener<SplashCubit, void>(
        listener: (context, state) {
          // Navigation is handled inside the Cubit
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/splash_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              if (_showLogo)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: Image.asset(
                      'assets/ic_logo.png',
                      width: 200,
                      height: 300,
                    ),
                  ),
                ),
              if (_isDrawerVisible)
                AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          0,
                          MediaQuery.of(context).size.height *
                              _slideAnimation.value),
                      child: child,
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: LandingBottomDrawer(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
