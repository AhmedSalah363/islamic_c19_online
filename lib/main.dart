import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';
import 'package:islamic_c19_online/modules/splash/screens/splash_screen.dart';
import 'modules/quran_details/screens/quran_details_screen.dart';
import 'package:islamic_c19_online/modules/onboarding/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.tajawal().fontFamily),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        LayoutScreen.routeName: (_) => const LayoutScreen(),
        QuranDetailsScreen.routeName: (_) => const QuranDetailsScreen(),
      },
    );
  }
}
