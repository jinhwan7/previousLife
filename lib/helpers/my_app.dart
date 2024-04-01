import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:previouslife/screens/splash_screen.dart';
import '../design_elements/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.colorPrimary,
        selectionColor: AppColors.colorPrimary,
        selectionHandleColor: AppColors.colorPrimary,
      )),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      //sign in screen
    );
  }
}
