
import 'package:flutter/material.dart';

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) => false,
);
// void navigateAndFinishh(context, widget) => Navigator.popAndPushNamed(
//   arguments: '',
//   context,
//   MaterialPageRoute(
//     builder: (context) => widget,
//   ),
// );

void navigateAndFinishRout(context, String routeScreen) => Navigator.pushNamed(
  context,
  routeScreen,
);