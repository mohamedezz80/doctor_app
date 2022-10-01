
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/cubit.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/state.dart';
import 'package:doctor_app/view/screen/auth/success_sign/success_sign.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/auth/custom_formfield.dart';
import 'package:doctor_app/view/widget/auth/custom_text_title.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit() ,
      child: BlocConsumer<ForgetPassCubit, ForgetPassStates>(
          listener: (context, state) {},
        builder: (context, state) {
          var cubit = ForgetPassCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.backGround,
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  "24",
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
                child: Form(
                  key: cubit.formStateReset,
                  child: ListView(
                    children:
                    [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/80,
                      ),
                      const CustomTextTitle(
                        text: "25",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,
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
                        hintText: "25",
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
                        height: MediaQuery.of(context).size.height/30,
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
                        hintText: "26",
                        labelText: "7",
                        iconData: Icons.lock_outline,
                        type: TextInputType.number,
                        myController: cubit.rePasswordController,
                        obscureText: cubit.isShowPass,
                        onTapIcon: (){
                          cubit.showPass();
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/30,
                      ),
                      CustomButtonAuth(
                        text: "27",
                        onPressed: ()
                        {
                          if(cubit.formStateReset.currentState!.validate())
                            {
                              navigateAndFinish(context, const SuccessSign());
                            }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,
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
