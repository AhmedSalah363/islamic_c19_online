import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/widgets/sura_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = "/quranDetails";
  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> suraList = [];
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraList.isEmpty) {
      readFiles(suraModel.suraNumber);
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: AppColors.gold,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(suraModel.nameEn),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Image.asset("assets/images/img_left_corner.png"),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      suraModel.nameAr,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset("assets/images/img_right_corner.png"),
                ),
              ],
            ),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: suraList.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         margin: EdgeInsets.all(4),
            //         padding: EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(16),
            //           border: Border.all(color: AppColors.gold),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "${suraList[index]} (${index + 1}) ",
            //             textDirection: TextDirection.rtl,
            //             style: TextStyle(fontSize: 20, color: AppColors.gold,fontFamily: GoogleFonts.amiriQuran().fontFamily),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.gold,
                      fontFamily: GoogleFonts.amiriQuran().fontFamily,
                      height: 2,
                    ),
                    children: suraList.map((e) {
                      int index = suraList.indexOf(e);
                      return TextSpan(
                        text: "$e(${index + 1})  ",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: AppColors.backgroundColor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: AppColors.gold,
                                            fontFamily: GoogleFonts.amiriQuran()
                                                .fontFamily,
                                            height: 2,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        style: TextStyle(
                          color: e.contains("اللَّهِ") ? Colors.orange : null,
                        ),
                      );
                    }).toList(),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readFiles(String suraNumber) async {
    String sura = await rootBundle.loadString("assets/suras/$suraNumber.txt");
    sura = sura.trim();
    suraList = sura.split("\n");
    //print(suraList[0]);
    setState(() {});
  }
}
