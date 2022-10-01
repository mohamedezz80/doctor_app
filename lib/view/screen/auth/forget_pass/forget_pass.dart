
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/cubit.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/state.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/virfycode_forget.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/auth/custom_formfield.dart';
import 'package:doctor_app/view/widget/auth/custom_text_body.dart';
import 'package:doctor_app/view/widget/auth/custom_text_title.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

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
                "9",
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
                key: cubit.formState,
                child: ListView(
                  children:
                  [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/80,
                    ),
                    const CustomTextTitle(
                      text: "18",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/300,
                    ),
                    const CustomTextBody(
                      text: "19",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/20,
                    ),
                    CustomTextForm(
                      valid: (email)
                      {
                        email != null && !EmailValidator.validate(email)
                            ? "Enter a valid email": null;
                      },
                      hintText: "6",
                      labelText: "5",
                      iconData: Icons.email_outlined,
                      type: TextInputType.emailAddress,
                      myController: cubit.emailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/30,
                    ),
                    CustomButtonAuth(
                      text: "20",
                      onPressed: ()
                      {
                        if(cubit.formState.currentState!.validate())
                          {
                            navigateAndFinish(context, const VirFyCodeForget());
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
