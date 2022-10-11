

import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/auth/success_sign/success_sign.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
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
                        height: hight/1.6,
                        width: width/1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Form(
                                  key: cubit.formKeyForget,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: hight/ 50,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back_ios,
                                                color: AppColor.primaryColor,
                                                  size: 30,
                                                ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: hight/40,
                                        ),
                                        const Text(
                                          "Change your password ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: hight / 20,
                                        ),
                                        Material(
                                          elevation: 5,
                                          shadowColor: AppColor.primaryColor,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.newPasswordController,
                                            keyboardType: TextInputType.phone,
                                            decoration:  InputDecoration(
                                                hintText: '123123123',
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                labelStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                label: Text(
                                                  "New Password",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                focusColor: AppColor.primaryColor,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.visibility,
                                                  color: AppColor.primaryColor,
                                                )),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: hight/ 20,
                                        ),
                                        Material(
                                          elevation: 5,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.confirmNewPasswordController,
                                            keyboardType: TextInputType.visiblePassword,
                                            decoration:  InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: '123123123',
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              labelStyle: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              label: Text(
                                                "Password Confirm",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              focusColor: AppColor.primaryColor,
                                              suffixStyle: TextStyle(
                                                color: AppColor.primaryColor,
                                                backgroundColor: AppColor.primaryColor,
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              suffixIcon: Icon(
                                                Icons.visibility,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: hight / 20,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: CustomButtonAuth(
                                            text: "Change password",
                                            onPressed: () async
                                            {
                                              if(cubit.newPasswordController.text == cubit.confirmNewPasswordController.text){
                                                await http.post(
                                                  Uri.parse("https://D3mk.com/manshy.php?phone${cubit.phoneController}"),
                                                  body: {
                                                    'new_password': cubit.newPasswordController.text,
                                                  },
                                                );
                                                setState(() {
                                                  cubit.passwordController = cubit.newPasswordController;
                                                });
                                                navigateAndFinish(context, const SuccessSign());
                                              } else{
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                        backgroundColor: Colors.white,
                                                        content: Text(
                                                          "This is not phone number of account",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        )));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
