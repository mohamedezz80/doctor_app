
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;



class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super (LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // var passwordController = TextEditingController();
  // var phoneController = TextEditingController();
  // bool isShowPass = true;
  // bool isChecked = false;

  // showPass()
  // {
  //   isShowPass = isShowPass == true ? false : true;
  //   emit(LoginPasswordVisibilityState());
  // }


  //  NotificationModel? notificationModel;
  //  void sendToken()  {
  //
  //   DioHelper.postData(
  //             url: '/',
  //             //token: token.toString(),
  //             data: {"token" : showToken}
  //           ).then((value)
  //           {
  //             notificationModel =
  //                 NotificationModel.fromJson(value.data);
  //             // ignore: unrelated_type_equality_checks
  //             if(value.statusCode == 200)
  //             {
  //               print(showToken);
  //
  //             }
  //           }).catchError((error)
  //       {
  //         print(error.toString());
  //       }
  //   );
  // }

  // void postData() async
  // {
  //   http.Response response = await http.post(
  //     Uri.parse("https://D3mk.com/manshy.php"),
  //       body:
  //       {
  //         'phone': phoneController.text,
  //         'password': passwordController.text,
  //       },
  //   );
  //   print(response.body);
  //   print(phoneController.text);
  //   print(passwordController.text);
  //
  //
  //
  //   if (response.body == "ok test") {
  //     print("Correct");
  //     navigateAndFinish(context , DoctorLayOut());
  //   } else {
  //
  //     print("Coddddddddddddddddddddddddrrect");
  //     ScaffoldMessenger.of(context )
  //         .showSnackBar(SnackBar(content: Text("Blank field is not allowed")));
  //   }
  // }
}

