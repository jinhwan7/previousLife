import 'package:flutter/material.dart';
import '../helpers/responsive.dart';
import 'app_colors.dart';
class MyGradientButton extends StatelessWidget {
  final String title;
  final Color backgroundColor, foregroundColor;
  final dynamic width, height;
  final Function callBackFunction;
  const MyGradientButton(this.title, this.backgroundColor, this.foregroundColor, this.width, this.height, this.callBackFunction, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Responsive.width(width, context),
        height: Responsive.height(height, context),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Responsive.height(height, context) / 2)
              )),
              elevation: MaterialStateProperty.resolveWith((states) => 0),
              fixedSize: MaterialStateProperty.resolveWith((states) => Size(Responsive.width(width, context), Responsive.height(height, context))),
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
              foregroundColor: MaterialStateProperty.resolveWith((states) => foregroundColor),
              iconColor: MaterialStateProperty.resolveWith((states) => Colors.amber),
              iconSize: MaterialStateProperty.resolveWith((states) => Responsive.height(3, context)), //This will work if icon as Icon
              textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
                  decorationThickness: 0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ))
          ),
          onPressed: () {
            callBackFunction();
          },
          child: Container(
            width: Responsive.width(width, context),
            height: Responsive.height(height, context),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(-1, 1),
                  end: Alignment(-1, -1),
                  colors: <Color>[
                    AppColors.colorPrimary,
                    AppColors.colorPrimary,
                  ],
                ),
                borderRadius: BorderRadius.circular(Responsive.height(height, context) / 2)
            ),
            child: Center(
              child: Text(
                  title,
                  style: const TextStyle(
                      decorationThickness: 0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
              ),
            )
          ),
        ),
      ),
    );
  }
}
