import 'package:flutter/material.dart';

import '../helpers/responsive.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final double borderRadius;
  final Color borderColor, focusedBorderColor;
  final String iconName;
  final double iconLeftPadding, iconTopPadding, iconBottomPadding;
  final double width, height;
  final bool isObscured;
  final String inputAction;
  final TextEditingController controller;

  const MyTextField(
      this.hint,
      this.borderRadius,
      this.borderColor,
      this.focusedBorderColor,
      this.iconName,
      this.iconLeftPadding,
      this.iconTopPadding,
      this.iconBottomPadding,
      this.width,
      this.height,
      this.isObscured,
      this.inputAction,
      this.controller,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.width(width, context),
      height: Responsive.height(height, context),
      child: TextField(
        textInputAction:
            inputAction == "Next" ? TextInputAction.next : TextInputAction.done,
        obscureText: isObscured,
        decoration: InputDecoration(
          filled: true,
          fillColor: borderColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: focusedBorderColor)),
          hintText: hint,
          hintStyle: const TextStyle(
              decorationThickness: 0,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 14),
        ),
        style: const TextStyle(
            decorationThickness: 0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14),
        controller: controller,
      ),
    );
  }
}
