
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/auth/success_sign/success_sign.dart';
import 'package:doctor_app/view/screen/auth/virfycode_signup/cubit.dart';
import 'package:doctor_app/view/screen/auth/virfycode_signup/state.dart';
import 'package:doctor_app/view/widget/auth/custom_text_body.dart';
import 'package:doctor_app/view/widget/auth/custom_text_title.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VirFyCodeSignUp extends StatelessWidget {
  const VirFyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VirFyCubit() ,
      child: BlocConsumer<VirFyCubit, VirFyStates>(
        listener: (context, state){},
          builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.backGround,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "21",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.grey,
                iconSize: 20,
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 1,
              ),
              child: ListView(
                children:
                [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/80,
                  ),
                  const CustomTextTitle(
                    text: "22",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/300,
                  ),
                  const CustomTextBody(
                    text: "23",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                  ),
                  OtpTextField(
                    numberOfFields: 5,
                    fieldWidth: 50,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(20),
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode)
                    {
                      navigateAndFinish(context, const SuccessSign());
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          );
          },
      ),
    );
  }
}
