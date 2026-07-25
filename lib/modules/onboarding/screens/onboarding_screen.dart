import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';
import 'package:islamic_c19_online/modules/onboarding/data/onboarding_data.dart';
import 'package:islamic_c19_online/modules/onboarding/widgets/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "/onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  int currentPage = 0;

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isFirstTime", false);

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      LayoutScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,

          globalBackgroundColor: const Color(0xff202020),

          controlsPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),

          controlsMargin: const EdgeInsets.only(bottom: 10),

          showSkipButton: false,

          showBackButton: currentPage != 0,

          back: const Text(
            "Back",
            style: TextStyle(
              color: Color(0xffE2BE7F),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          next: const Text(
            "Next",
            style: TextStyle(
              color: Color(0xffE2BE7F),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          done: const Text(
            "Finish",
            style: TextStyle(
              color: Color(0xffE2BE7F),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          dotsDecorator: const DotsDecorator(
            color: Color(0xff707070),
            activeColor: Color(0xffE2BE7F),
            size: Size(8, 8),
            activeSize: Size(22, 8),
            spacing: EdgeInsets.symmetric(horizontal: 4),
            activeShape: StadiumBorder(),
          ),

          onChange: (index) {
            setState(() {
              currentPage = index;
            });
          },

          onDone: finishOnboarding,

          pages: onboardingPages.map((page) {
            return PageViewModel(
              title: "",
              body: "",

              decoration: const PageDecoration(
                pageColor: Color(0xff202020),
                imageFlex: 1,
                bodyFlex: 0,
                contentMargin: EdgeInsets.zero,
              ),

              image: OnboardingPage(
                image: page.image,
                title: page.title,
                description: page.description,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
