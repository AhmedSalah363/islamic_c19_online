import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';
import 'package:islamic_c19_online/modules/onboarding/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 5));

    final prefs = await SharedPreferences.getInstance();

    final bool isFirstTime = prefs.getBool("isFirstTime") ?? true;

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      isFirstTime ? OnboardingScreen.routeName : LayoutScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                duration: const Duration(seconds: 2),
                child: Center(
                  child: Image.asset("assets/logo/app_logo.png", width: 185),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(seconds: 2),
              child: Image.asset("assets/logo/route_logo.png", width: 244),
            ),
          ],
        ),
      ),
    );
  }
}
