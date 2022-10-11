
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:flutter/material.dart';

// var cubit = LoginCubit.get(BuildContext);
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginPasswordVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}
class IsDark extends LoginStates{}