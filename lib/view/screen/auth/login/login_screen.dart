import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/token.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/auth/sign_up/signup_screen.dart';
import 'package:doctor_app/view/screen/layout/doctor_layout.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/auth/custom_text_body.dart';
import 'package:doctor_app/view/widget/auth/custom_text_sign.dart';
import 'package:doctor_app/view/widget/auth/custom_text_title.dart';
import 'package:doctor_app/view/widget/auth/logo.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPass = true;
  bool isChecked = false;
  late Box box;

  showPass() {
    isShowPass = isShowPass == true ? false : true;
  }



  void getData() async {
    var box = await Hive.openBox("loginData");
    if (box.get("phone") != null) {
      phoneController.text = box.get("phone");
      isChecked = true;
      setState(() {});
    }

    if (box.get("password") != null) {
      passwordController.text = box.get("password");
      isChecked = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: AppColor.backGround,
            appBar: AppBar(
              backgroundColor: AppColor.backGround,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "2",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: () {},
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
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  children: [
                    const Logo(),
                    const CustomTextTitle(
                      text: "3",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 300,
                    ),
                    const CustomTextBody(
                      text: "4",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    // Text(
                    //     cubit.showToken,
                    // ),
                    // CustomTextForm(
                    //   valid: (val)
                    //   {
                    //     if(val!.isEmpty || val.length < 8)
                    //       {
                    //       return "Enter Correct Phone Number";
                    //     }
                    //     return null;
                    //   },
                    //   hintText: "16",
                    //   labelText: "15",
                    //   iconData: Icons.smartphone_outlined,
                    //   type: TextInputType.phone,
                    //   myController: cubit.phoneController,
                    // ),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          labelText: "phone",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.password)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Remember Me",
                        // style: TextStyle(
                        //     color: AppColor.primaryColor, fontSize: 14),
                      ),
                      value: isChecked,
                      activeColor: AppColor.primaryColor,
                      onChanged: (value) {
                        isChecked = !isChecked;
                        setState(() {});
                      },
                      contentPadding: EdgeInsets.only(left: 0, top: 0),
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    CustomButtonAuth(
                      text: "2",
                      onPressed: () async {
                        final isValidForm =
                        formKey.currentState!.validate();
                        if (isValidForm) {
                          // box.put("phone", phoneController.text);
                          // box.put("password", passwordController.text);
                          Future.delayed(const Duration(milliseconds: 0),
                              () async {
                            http.Response response = await http.post(
                              Uri.parse("https://D3mk.com/manshy.php"),
                              body: {
                                'phone': phoneController.text,
                                'password': passwordController.text,
                              },
                            );
                            print(response.body);
                            print(phoneController.text);
                            print(passwordController.text);
                            if (response.body == "ok test") {
                              print("Correct");
                              navigateAndFinish(context, const DoctorLayOut());
                              getToken();
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  "phone", phoneController.text);
                              sharedPreferences.setString(
                                  "token",
                                  FirebaseMessaging.instance
                                      .getToken()
                                      .toString());
                            } else {
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    CustomTextSign(
                      text1: "10",
                      text2: "11",
                      onTap: () {
                        navigateTo(context, const SignUp());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      http.post(Uri.parse("https://D3mk.com/manshy.php"),
          body: {'token': token, 'phone': phoneController.text});
      //print(token);
      print(phoneController.text);
    });
  }
}
