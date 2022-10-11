
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/layout/doctor_layout.dart';
import 'package:doctor_app/view/screen/on_boarding/on_boarding.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class IsLogined extends StatefulWidget {


  const IsLogined({Key? key}) : super(key: key);

  @override
  State<IsLogined> createState() => _IsLoginedState();
}

class _IsLoginedState extends State<IsLogined> {

  String? token ;
  static var phone ;
  bool initial = true;

  @override
  Widget build(BuildContext context) {

    LoginCubit cubit = LoginCubit.get(context);
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token = sharedPrefValue.getString("token");
          phone = sharedPrefValue.getString("phone");
          print("Token : $token");
          print("phone : $phone");
        });
      });
      return CircularProgressIndicator(color: AppColor.primaryColor);
    } else
      {
      if (token == null && cubit.isLast == false) {
        return const OnBoarding();
      } else
        {
          print("Token : $token");
        return const DoctorLayOut();
      }
    }
  }
}

void signOut(context)
{

  SharedPreferences.getInstance().then((sharedRemove)
  {
    sharedRemove.remove("token");
    navigateAndFinish(context, Login());
  });
}




