import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LayoutScreen.routeName,
        (route) => false,
      );
    });

    super.initState();
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
                duration: Duration(seconds: 2),
                child: Center(
                  child: Image.asset("assets/logo/app_logo.png", width: 185),
                ),
              ),
            ),

            FadeInUp(
              delay: Duration(seconds: 2),
              child: Image.asset("assets/logo/route_logo.png", width: 244),
            ),
          ],
        ),
      ),
    );
  }
}
