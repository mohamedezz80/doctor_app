import 'package:doctor_app/core/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatelessWidget {

  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final TextInputType type;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.type,
    this.obscureText,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: myController,
      validator: valid,
      keyboardType: type,
      obscureText:
      obscureText == null || obscureText == false ? false : true,
      decoration:  InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            labelText,
            style: TextStyle(
              color: AppColor.primaryColor,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(iconData, color: AppColor.primaryColor,),
          ),
          focusColor: AppColor.primaryColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8 ,
            horizontal: 33,
          ),
          border: const OutlineInputBorder(
            borderSide:  BorderSide.none,
          )
      ),
    );
  }
}
