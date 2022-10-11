import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: AppColor.backGround,
      child: ClipOval(
        child: Image.asset(
          AppImageAsset.doctorphoto,
        ),
      ),
    );
  }
}
