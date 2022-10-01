import 'package:doctor_app/core/const/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {

  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/14,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,

        child: Text(text),
      ),
    );
  }
}
