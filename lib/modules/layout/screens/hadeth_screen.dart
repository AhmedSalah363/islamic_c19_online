import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> hadteh = [];

  @override
  Widget build(BuildContext context) {
    if (hadteh.isEmpty) {
      readFiles();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_hadeth.jpg"),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Image.asset("assets/images/quran_header.png"),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeFactor: 0.3,
                    height: double.infinity,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                  ),
                  items: hadteh.map((i) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.gold,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: -10,
                            right: -10,
                            child: Image.asset(
                              "assets/images/hadeth_footer.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/img_left_corner.png",
                                        color: AppColors.backgroundColor,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            i.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.backgroundColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/img_right_corner.png",
                                        color: AppColors.backgroundColor,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  i.body,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.ltr,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readFiles() async {
    for (int i = 1; i <= 50; i++) {
      String data = await rootBundle.loadString("assets/hadeeth/h$i.txt");
      data = data.trim();
      List<String> hadethList = data.split("\n");
      hadteh.add(
        HadethData(title: hadethList[0].trim(), body: hadethList[1].trim()),
      );
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  String body;
  HadethData({required this.title, required this.body});
}
