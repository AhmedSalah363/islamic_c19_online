import 'package:flutter/material.dart';
import 'package:islamic_c19_online/modules/quran_details/screens/quran_details_screen.dart';

import '../../../core/theme/app_colors.dart';

class SuraWidget extends StatelessWidget {
  const SuraWidget({
    super.key,
    required this.suraModel
  });

  final SuraModel suraModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetailsScreen.routeName, arguments: suraModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/aya.png", width: 60, height: 60),
                Text(
                  suraModel.suraNumber,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraModel.nameEn,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "${suraModel.ayaNumber} Verses",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              suraModel.nameAr,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuraModel {
  String nameEn;
  String nameAr;
  String ayaNumber;
  String suraNumber;

  SuraModel({
    required this.nameEn,
    required this.nameAr,
    required this.ayaNumber,
    required this.suraNumber,
  });
}
