
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/Home_screen/home_screen.dart';
import 'package:doctor_app/view/screen/layout/doctor_layout.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:flutter/material.dart';

class SuccessBooking extends StatelessWidget {
  const SuccessBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Doctor'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 150,
                  color: AppColor.primaryColor,
                ),
                const Text('تم الحجز بنجاح'),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomButtonAuth(
                    text: 'الصفحة الرئيسية',
                    onPressed: ()
                    {
                       navigateAndFinish(context, const DoctorLayOut());
                     // Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
