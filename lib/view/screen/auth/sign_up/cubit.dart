

import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/auth/sign_up/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super (SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  bool isShowPass = true;

  showPass()
  {
    isShowPass = isShowPass == true ? false : true;
    emit(SignUpPasswordVisibilityState());
  }

}

