import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:doctor_app/network/dio_helper.dart';
import 'package:doctor_app/view/screen/Home_screen/Homescreen.dart';
import 'package:doctor_app/view/screen/Person_screen/Person_screen.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/booking_screens/booking_screen.dart';
import 'package:doctor_app/view/screen/notifications_screen/notification_screen.dart';
import 'package:doctor_app/view/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  int currentIndex = 2;

  List<Widget> bottomScreen = [
    const Person(),
    const Booking(),
    const Home(),
    const NotificationScreen(),
    Settings(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(LayOutChangeBottomNavState());
  }

  GlobalKey<FormState> formKeySignUP = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyForget = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  var phoneLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController phoneForgetController = TextEditingController();

  var sharedName;
  SharedPreferences? prefName;

  Future<String> sharedPrefName() async {
    prefName = await SharedPreferences.getInstance();
    sharedName = prefName!.getString('username');
    emit(NameLoaded());
    return sharedName.toString();
  }

  var sharedAge;
  SharedPreferences? prefAge;

  Future<String> sharedPrefAge() async {
    prefAge = await SharedPreferences.getInstance();
    sharedAge = prefAge!.getInt('age');
    return sharedAge.toString();
  }

  var sharedId;
  SharedPreferences? prefId;

  Future<String> sharedPrefId() async {
    prefId = await SharedPreferences.getInstance();
    sharedId = prefId!.getString('id');
    return sharedId.toString();
  }

  Future<void> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    //emit(AuthLoading());

    // Get the user from the API
    //final user = apiResponse['user'];

    //emit(AuthConnected(user));
  }

  List<dynamic> schaduleData = [];

  Future<List<dynamic>> getSchaduleData() async {
    await DioHelper.getSchaduleData(
      url: '/manshy.php',
      query: {
        'timewoek': 'ok',
        'fbclid':
            'IwAR0FDjpyd4PElQvhckbMlgvKw33bPqDsBfow5ML5XLJ7vlg16PcEblssLE0',
      },
    ).then((value) {
      schaduleData = value.data;
      emit(ScheduleDataLoaded());
    }).catchError((onError) {
      print(onError.toString());
    });
    return schaduleData;
  }

  bool val = true;
  var responsse;
  var timeMorning;
  int isSelected = -1;
  DateTime dateTime = DateTime.now();
  DateTime dateTimeConfirm = DateTime.now();

  bool isLast = false;

  bool isDark = false;
  IconData iconLight = Icons.sunny;
  IconData iconDark = Icons.nightlight_round;

  void changeThemeMode() {
    isDark = !isDark;
    emit(IsDark());
  }

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
