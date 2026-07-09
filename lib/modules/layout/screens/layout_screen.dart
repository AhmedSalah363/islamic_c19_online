import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/screens/hadeth_screen.dart';
import 'package:islamic_c19_online/modules/layout/screens/quran_screen.dart';
import 'package:islamic_c19_online/modules/layout/screens/radio_screen.dart';
import 'package:islamic_c19_online/modules/layout/screens/salaa_screen.dart';
import 'package:islamic_c19_online/modules/layout/screens/sebha_screen.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "/layout";

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SalaaScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        backgroundColor: AppColors.gold,
        fixedColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(color: AppColors.white),
        selectedIconTheme: IconThemeData(color: AppColors.white),
        items: [
          getNavItem(label: "Quran", image: "assets/icons/icn_quran.png"),
          getNavItem(label: "Hadeth", image: "assets/icons/icn_hadeth.png"),
          getNavItem(label: "Sebha", image: "assets/icons/icn_sebha.png"),
          getNavItem(label: "Radio", image: "assets/icons/icn_radio.png"),
          getNavItem(label: "Salaa", image: "assets/icons/icn_salaa.png"),
        ],
      ),
    );
  }

  BottomNavigationBarItem getNavItem({
    required String label,
    required String image,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(image, height: 32),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.backgroundColor.withValues(alpha: 0.6),
        ),
        child: Image.asset(image, width: 32, color: AppColors.white),
      ),
      label: label,
    );
  }
}
