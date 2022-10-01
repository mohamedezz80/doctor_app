
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/auth/sign_up/cubit.dart';
import 'package:doctor_app/view/screen/auth/sign_up/state.dart';
import 'package:doctor_app/view/screen/auth/virfycode_signup/virfycode_signup.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/auth/custom_formfield.dart';
import 'package:doctor_app/view/widget/auth/custom_text_body.dart';
import 'package:doctor_app/view/widget/auth/custom_text_sign.dart';
import 'package:doctor_app/view/widget/auth/custom_text_title.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit() ,
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SignUpCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.backGround,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "11",
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
              ),
              child: Form(
                key: cubit.formState,
                child: ListView(
                  children:
                  [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/80,
                    ),
                    const CustomTextTitle(
                      text: "3",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/300,
                    ),
                    const CustomTextBody(
                      text: "12",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/35,
                    ),
                    CustomTextForm(
                      valid: (val) {
                        if (val!.isEmpty || !RegExp("r'^[a-z A-Z]").hasMatch(
                            val)) {
                          return "Enter Correct Name";
                        }
                      },
                      hintText: "14",
                      labelText: "13",
                      iconData: Icons.person_outline,
                      type: TextInputType.name,
                      myController: cubit.userNameController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/25,
                    ),
                    CustomTextForm(
                      valid: (email)
                      {
                        email != null && !EmailValidator.validate(email)
                            ? "Enter a valid email": null;
                        return null;
                      },
                      hintText: "6",
                      labelText: "5",
                      iconData: Icons.email_outlined,
                      type: TextInputType.emailAddress,
                      myController: cubit.emailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/25,
                    ),
                    CustomTextForm(
                      valid: (val)
                      {
                        if(val != null && val.length < 8) {
                          return "Enter min. 8 characters";
                        } else {
                          return null;
                        }
                      },
                      hintText: "8",
                      labelText: "7",
                      iconData: Icons.lock_outline,
                      type: TextInputType.number,
                      myController: cubit.passwordController,
                      obscureText: cubit.isShowPass,
                      onTapIcon: (){
                        cubit.showPass();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/25,
                    ),
                    CustomTextForm(
                      valid: (val)
                      {
                        if(val!.isEmpty || !RegExp("r'^[a-z A-Z]").hasMatch
                          (val)){
                          return "Enter Correct Phone Number";
                        }
                        return null;
                      },
                      hintText: "16",
                      labelText: "15",
                      iconData: Icons.smartphone_outlined,
                      type: TextInputType.phone,
                      myController: cubit.phoneController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/25,
                    ),
                    CustomButtonAuth(
                      text: "11",
                      onPressed: ()
                      {
                        if(cubit.formState.currentState!.validate())
                          {
                            navigateAndFinish(context, const VirFyCodeSignUp());
                          }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/20,
                    ),
                    CustomTextSign(
                      text1: "17",
                      text2: "2",
                      onTap: ()
                      {
                        navigateTo(context,  Login());
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/60,
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
}
