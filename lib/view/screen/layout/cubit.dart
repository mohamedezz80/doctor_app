
import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/Home_screen/Homescreen.dart';
import 'package:doctor_app/view/screen/Person_screen/Person_screen.dart';
import 'package:doctor_app/view/screen/booking_screens/booking_screen.dart';
import 'package:doctor_app/view/screen/layout/state.dart';
import 'package:doctor_app/view/screen/notifications_screen/notification_screen.dart';
import 'package:doctor_app/view/screen/on_boarding/on_boarding.dart';
import 'package:doctor_app/view/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutCubit extends Cubit<LayOutStates>
{
  LayoutCubit() : super (LayOutInitialState());
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);



  var sharedName;
  SharedPreferences? prefName;
  Future<String> sharedPrefName() async
  {
    prefName = await SharedPreferences.getInstance();
    sharedName = prefName!.getString('username');
    return sharedName.toString();

  }


  // int currentIndex = 2;
  //
  // List<Widget> bottomScreen =
  //     [
  //       const Person(),
  //       const Booking(),
  //       const Home(),
  //       const NotificationScreen(),
  //       Settings(),
  //     ];
  //
  // void changeBottom(int index)
  // {
  //   currentIndex = index;
  //   emit(LayOutChangeBottomNavState());
  // }



}