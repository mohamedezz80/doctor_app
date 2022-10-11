
import 'dart:async';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/layout/doctor_layout.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:flutter/material.dart';

class SuccessBooking extends StatefulWidget {
  const SuccessBooking({Key? key}) : super(key: key);

  @override
  State<SuccessBooking> createState() => _SuccessBookingState();
}

class _SuccessBookingState extends State<SuccessBooking> {

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          //clipBehavior: Clip.none,
          children: [
            Container(
              height: hight/5.5,
              width: width/3,
              margin: EdgeInsets.only(
                top: hight / 60,
                right: width / 50,
                left: width / 3,
                bottom: hight / 15,
              ),
              child: Image.asset(
                AppImageAsset.logoo,
                fit: BoxFit.contain,
                //scale: .2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: hight/ 5,
                right: 15,
                left: 15,
              ),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: hight/1.8,
                  width: width/1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:
                              [
                                SizedBox(
                                  height: hight/20,
                                ),
                                Icon(
                                  Icons.check_circle_outline,
                                  size: 100,
                                  color: AppColor.primaryColor,
                                ),
                                SizedBox(
                                  height: hight/15,
                                ),
                                 Text(
                                  "Success",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: hight/60,
                                ),
                                Text(
                                  "Go To Home",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: hight/15,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: CustomButtonAuth(
                                    text: "Home",
                                    onPressed: ()
                                    {
                                      navigateAndFinish(context,  const DoctorLayOut());
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height/45,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
