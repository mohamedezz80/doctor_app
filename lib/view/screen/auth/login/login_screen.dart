import 'dart:convert';

import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/forget_pass.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/auth/sign_up/signup_screen.dart';
import 'package:doctor_app/view/screen/layout/doctor_layout.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {




  //GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPass = true;
  bool isChecked = false;
  late Box box;



  // void getData() async {
  //   var box = await Hive.openBox("loginData");
  //   if (box.get("phone") != null) {
  //     phoneController.text = box.get("phone");
  //     isChecked = true;
  //     setState(() {});
  //   }

  //   if (box.get("password") != null) {
  //     passwordController.text = box.get("password");
  //     isChecked = true;
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }



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
                        height: hight/1.5,
                        width: width/1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Form(
                                  key: cubit.formKeyLogin,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: hight/ 30,
                                        ),
                                        const Text(
                                          "Login Account",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          height: hight / 20,
                                        ),
                                        Material(
                                          elevation: 5,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.phoneLoginController,
                                            keyboardType: TextInputType.phone,
                                            decoration:   InputDecoration(
                                                hintText: '01155555555',
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                labelStyle: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                label: const Text(
                                                  "Phone",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                focusColor: AppColor.primaryColor,
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.phone,
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
                                            controller: cubit.passwordLoginController,
                                            keyboardType: TextInputType.visiblePassword,
                                            decoration:  InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: '123123123',
                                              hintStyle: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              label: const Text(
                                                "Password",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              focusColor: AppColor.primaryColor,
                                              suffixStyle: TextStyle(
                                                color: AppColor.primaryColor,
                                                backgroundColor: AppColor.primaryColor,
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              suffixIcon: Icon(
                                                Icons.password,
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
                                          height: MediaQuery.of(context).size.height / 23,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                navigateTo(context, const ForgetPassword());
                                              },
                                              child:  Text(
                                                "Forgot your password ?",
                                                style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: hight / 20,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: CustomButtonAuth(
                                            text: "Login",
                                            onPressed: () async {
                                                LoginCubit cubit = LoginCubit.get(context);
                                                await FirebaseMessaging.instance.getToken().then((token) {
                                              final isValidForm =
                                              cubit.formKeyLogin.currentState!.validate();
                                              if (isValidForm) {
                                                // box.put("phone", phoneController.text);
                                                // box.put("password", passwordController.text);
                                                Future.delayed(const Duration(milliseconds: 0),
                                                        () async
                                                        {
                                                            http.Response response = await http.post(
                                                              Uri.parse("https://D3mk.com/manshy.php"),
                                                              body: {
                                                                'phone_loin': cubit.phoneLoginController.text,
                                                                'password_login': cubit.passwordLoginController.text,
                                                                'tokenz' : token,
                                                              },
                                                            );

                                                            SharedPreferences pref =
                                                            await SharedPreferences.getInstance();
                                                            pref.setString('id',jsonDecode(response.body)['info']['id'] );
                                                            pref.setString('username',jsonDecode(response.body)['info']['name'] );
                                                            pref.setInt('age',jsonDecode(response.body)['info']['age'] );
                                                            print(jsonDecode(response.body)['info']['stute'] );
                                                            //if (jsonDecode(response.body)['info']['stute'] == 'ok')
                                                            if (jsonDecode(response.body)['info']['stute'] == 'ok')
                                                                {

                                                              print(cubit.phoneLoginController.text);
                                                              print(token);
                                                              print(jsonDecode(response.body)['info']['stute']);

                                                              var shared = pref.getString('userData');
                                                              print(shared);
                                                              //getToken();
                                                              SharedPreferences sharedPreferences =
                                                              await SharedPreferences.getInstance();
                                                              sharedPreferences.setString(
                                                                  "phone", cubit.phoneLoginController.text);
                                                              sharedPreferences.setString(
                                                                  "token",
                                                                  FirebaseMessaging.instance
                                                                      .getToken()
                                                                      .toString()
                                                              );
                                                              navigateAndFinish(context, const DoctorLayOut());
                                                            } else {
                                                              ScaffoldMessenger
                                                                  .of(context)
                                                                  .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(

                                                                          "The phone number and password is not correct")));
                                                            }
                                                          }
                                                          );
                                              }


                                                });




                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: hight / 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [
                                            const Text(
                                                'If you have no an account ? ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                navigateTo(context, const SignUp());
                                              },
                                              child:  Text(
                                                  'SIN UP',
                                                style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
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
