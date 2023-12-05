
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/core/const/token.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/cubit.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/state.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/virfycode_forget.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/auth/success_sign/success_sign.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/auth/logo.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                                          height: hight/ 30,
                                        ),
                                        const Text(
                                          "Forgot your password ?",
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
                                          elevation: 2,
                                          shadowColor: Colors.black87,
                                          borderRadius: BorderRadius.circular(50),
                                          child: TextFormField(
                                            controller: cubit.phoneForgetController,
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
                                          height: hight / 15,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: CustomButtonAuth(
                                            text: "Forget Password",
                                            onPressed: () async
                                            {
                                              if(cubit.newPasswordController.text == cubit.confirmNewPasswordController.text){
                                                await http.post(
                                                  Uri.parse("https://D3mk.com/manshy.php?phone${cubit.phoneController}"),
                                                  body:
                                                  {
                                                    'phone_forget': cubit.phoneForgetController.text,
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
                                        SizedBox(
                                          height: hight / 25,
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
                                              child:  Text(
                                                'Login',
                                                style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w900,
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
