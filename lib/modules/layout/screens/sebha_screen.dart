import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  final List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];

  int counter = 0;
  int zekrIndex = 0;
  double rotationTurns = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Positioned.fill(
            child: Image.asset(
              "assets/sebha/sebiha_background.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  /// Logo
                  Positioned(
                    top: 10,
                    child: Image.asset(
                      "assets/images/quran_header.png",
                      width: size.width * 1.0,
                    ),
                  ),

                  /// Aya
                  const Positioned(
                    top: 200,
                    child: Text(
                      "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Sebha Head
                  Positioned(
                    top: 250,
                    child: Image.asset("assets/sebha/sebha_tag.png", width: 90),
                  ),

                  /// Sebha Body
                  Positioned(
                    top: 300,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: onSebhaTap,
                          child: AnimatedRotation(
                            turns: rotationTurns,
                            duration: const Duration(milliseconds: 250),
                            child: Image.asset(
                              "assets/sebha/sebha-body.png",
                              width: size.width * .72,
                            ),
                          ),
                        ),

                        /// Zekr
                        Positioned(
                          top: 110,
                          child: Text(
                            azkar[zekrIndex],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        /// Counter
                        Positioned(
                          top: 170,
                          child: Text(
                            "$counter",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaTap() {
    setState(() {
      counter++;
      rotationTurns += 0.04;

      if (counter == 33) {
        counter = 0;

        zekrIndex++;

        if (zekrIndex >= azkar.length) {
          zekrIndex = 0;
        }
      }
    });
  }
}
