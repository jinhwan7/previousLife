import 'dart:async';

import 'package:flutter/material.dart';
import '../helpers/responsive.dart';
import 'menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        Responsive.totalWidth = constraints.maxWidth;
        Responsive.totalHeight = constraints.maxHeight;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/fortune_telling.png',
                width: Responsive.width(90, context),
                height: Responsive.height(40, context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Responsive.height(2, context)),
              child: const Text(
                "Previous Life",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ],
        );
      }),
    );
  }
}
