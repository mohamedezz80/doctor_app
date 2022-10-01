

import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/auth/forget_pass/state.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassCubit extends Cubit<ForgetPassStates>
{
  ForgetPassCubit() : super (ForgetPassInitialState());
  static ForgetPassCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> formStateReset = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  bool isShowPass = true;

  showPass()
  {
    isShowPass = isShowPass == true ? false : true;
    emit(ForgetPasswordVisibilityState());
  }

}

