
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessSign extends StatelessWidget {
  const SuccessSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit() ,
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.backGround,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "29",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    children:
                    [
                      const Icon(
                        Icons.check_circle_outline,
                        size: 150,
                        color: AppColor.primaryColor,
                      ),
                      const Text(
                        "30",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        child: CustomButtonAuth(
                          text: "2",
                          onPressed: ()
                          {
                            navigateAndFinish(context,  Login());
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
