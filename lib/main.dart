import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'design_elements/app_colors.dart';
import 'helpers/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  MobileAds.instance.initialize();
  runApp(Container(
    color: AppColors.colorPrimary,
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
        theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.colorPrimary,
              selectionColor: AppColors.colorPrimary,
              selectionHandleColor: AppColors.colorPrimary,
            ),
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent))),
  ));
}
