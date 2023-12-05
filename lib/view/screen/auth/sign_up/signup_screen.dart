
import 'dart:convert';

import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                        height: hight/1.29,
                        width: width/1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Form(
                                  key: cubit.formKeySignUP,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: hight/ 60,
                                        ),
                                        const Text(
                                          "Sign Up Account",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          height: hight / 25,
                                        ),
                                        Material(
                                          elevation: 2,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.nameController,
                                            keyboardType: TextInputType.name,
                                            decoration:   InputDecoration(
                                                hintText: 'Mohamed Aly',
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
                                                  "Name",
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
                                                  Icons.person_outline,
                                                  color: AppColor.primaryColor,
                                                )),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: hight/ 25,
                                        ),
                                        Material(
                                          elevation: 2,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.addressController,
                                            keyboardType: TextInputType.text,
                                            decoration:   InputDecoration(
                                                hintText: 'Helwan City',
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
                                                  "Address",
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
                                                  Icons.holiday_village_outlined,
                                                  color: AppColor.primaryColor,
                                                )),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: hight/ 25,
                                        ),
                                        Material(
                                          elevation: 2,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.ageController,
                                            keyboardType: TextInputType.text,
                                            decoration:   InputDecoration(
                                                hintText: '35',
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
                                                  "Age",
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
                                                  Icons.edit,
                                                  color: AppColor.primaryColor,
                                                )),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: hight/ 25,
                                        ),
                                        Material(
                                          elevation: 2,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.phoneController,
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
                                                border: OutlineInputBorder(
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
                                          height: hight/ 25,
                                        ),
                                        Material(
                                          elevation: 2,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.passwordController,
                                            keyboardType: TextInputType.visiblePassword,
                                            decoration: InputDecoration(
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
                                          height: hight / 25,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: CustomButtonAuth(
                                            text: "تسجيل دخول",
                                            onPressed: () async {
                                              final isValidForm =
                                              cubit.formKeySignUP.currentState!.validate();
                                              if (isValidForm) {
                                                // box.put("phone", phoneController.text);
                                                // box.put("password", passwordController.text);
                                                Future.delayed(const Duration(milliseconds: 0),
                                                        () async
                                                        {
                                                      http.Response response = await http.post(
                                                        Uri.parse("https://D3mk.com/manshy.php"),
                                                        body: {
                                                          'name': cubit.nameController.text,
                                                          'address': cubit.addressController.text,
                                                          'age': cubit.ageController.text,
                                                          'phone': cubit.phoneController.text,
                                                          'password': cubit.passwordController.text,
                                                        },
                                                      );
                                                      SharedPreferences pref =
                                                      await SharedPreferences.getInstance();
                                                      pref.setString('id',jsonDecode(response.body)['info']['id'] );
                                                      pref.setString('username',jsonDecode(response.body)['info']['name'] );
                                                      pref.setInt('age',jsonDecode(response.body)['info']['age'] );
                                                      print(response.body);
                                                      print(cubit.phoneController.text);
                                                      print(cubit.passwordController.text);
                                                      if (response.body == "ok test") {
                                                        print("Correct");
                                                        navigateAndFinish(context, Login());
                                                        getToken();
                                                        SharedPreferences sharedPreferences =
                                                        await SharedPreferences.getInstance();
                                                        sharedPreferences.setString(
                                                            "phone", cubit.phoneController.text);
                                                        sharedPreferences.setString(
                                                            "token",
                                                            FirebaseMessaging.instance
                                                                .getToken()
                                                                .toString());
                                                      } else
                                                      {
                                                        print("not Correct");
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    "The phone number and password is not correct")));
                                                      }
                                                    });
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: hight / 35,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [
                                            const Text(
                                              'Back To ? ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                navigateTo(context, Login());
                                              },
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: hight / 35,
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
  void getToken() async {
    LoginCubit cubit = LoginCubit.get(context);
    await FirebaseMessaging.instance.getToken().then((token) {
      http.post(Uri.parse("https://D3mk.com/manshy.php"),
          body: {'token': token,});
      //print(token);
      print(cubit.phoneController.text);
    });
  }
}
