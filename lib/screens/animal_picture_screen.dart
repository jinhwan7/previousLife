import 'package:flutter/material.dart';
import 'package:previouslife/screens/menu_screen.dart';
import '../design_elements/app_colors.dart';
import '../design_elements/my_gradient_button.dart';
import '../helpers/responsive.dart';
import '../design_elements/globals.dart' as globals;

class AnimalPictureScreen extends StatefulWidget {
  const AnimalPictureScreen({super.key});
  @override
  createState() => AnimalPictureScreenState();
}

class AnimalPictureScreenState extends State<AnimalPictureScreen> {
  @override
  initState() {
    super.initState();
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
                'assets/animal_image.jpeg',
                width: Responsive.width(90, context),
                height: Responsive.height(40, context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Responsive.height(5, context)),
              child: Center(
                child: MyGradientButton(
                    globals.language == 'English' ? 'Home Screen' : '홈 화면',
                    AppColors.colorPrimary,
                    Colors.white,
                    75.0,
                    6.0, () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()),
                      (Route<dynamic> route) => false);
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
