import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),

          /// Header Logo
          Image.asset(
            "assets/images/quran_header.png",
            width: size.width * .75,
          ),

          const SizedBox(height: 30),

          /// Illustration
          Expanded(child: Image.asset(image, fit: BoxFit.contain)),

          const SizedBox(height: 25),

          /// Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.gold,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          /// Description
          if (description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
            ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
