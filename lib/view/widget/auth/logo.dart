import 'package:doctor_app/core/const/image_asset.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundColor: Colors.red,
      child: ClipOval(
        child: Image.asset(
          AppImageAsset.logo,
        ),
      ),
    );
  }
}
