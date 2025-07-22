// ignore_for_file: camel_case_types, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math';

import 'package:shella_design/common/util/navigation/navigation.dart';

class Success_Celebration_dialog extends StatefulWidget {
  const Success_Celebration_dialog({super.key});

  @override
  _Success_Celebration_dialogState createState() => _Success_Celebration_dialogState();
}

class _Success_Celebration_dialogState extends State<Success_Celebration_dialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText('🎉 تم التسجيل بنجاح! 🎉'),
                ],
                isRepeatingAnimation: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 20,
              minBlastForce: 5,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.3,
              colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
            ),
          ),
        ],
      ),
    );
  }
}

//

class SuccessCelebrationWidget extends StatefulWidget {
  final VoidCallback? onClose;

  const SuccessCelebrationWidget({super.key, this.onClose});

  @override
  State<SuccessCelebrationWidget> createState() => _SuccessCelebrationWidgetState();
}

class _SuccessCelebrationWidgetState extends State<SuccessCelebrationWidget> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();

    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) {
        nav.back();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 20,
              minBlastForce: 5,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.3,
              colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
            ),

            //

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("🎉", textAlign: TextAlign.center, style: TextStyle(fontSize: 70)),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('🎉 مبروك! لقد فزت معنا بقسيمة شرائية! 🎉'),
                      ],
                      isRepeatingAnimation: true, // ✅ اجعلها تتكرر دائمًا
                      repeatForever: true, // ✅ تتكرر بلا توقف
                      pause: Duration(milliseconds: 500), // ⏸️ وقت التوقف بين كل دورة
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '''عميلنا العزيز
يسعدنا أن نزف إليك خبر فوزك معنا بقسيمة شرائية

 تصل قيمتها إلى 250 ريال! 🛍️

هذه فرصتك للاستمتاع بمنتجاتنا وخدماتنا المميزة.
للحصول على قسيمتك سجل عضويتك الان بقيدها''',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),

            //
          ],
        ),
      ),
    );
  }
}
