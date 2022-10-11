import 'package:doctor_app/core/const/color.dart';
import 'package:flutter/material.dart';

class CustomTextSign extends StatelessWidget {

  final String text1;
  final String text2;
  final void Function() onTap;
  const CustomTextSign({Key? key, required this.text1, required this.text2, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
