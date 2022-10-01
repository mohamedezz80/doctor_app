

import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/Home_screen/home_screen.dart';
import 'package:doctor_app/view/screen/booking_screens/booking.dart';
import 'package:doctor_app/view/screen/booking_screens/booking_screen.dart';
import 'package:doctor_app/view/screen/booking_screens/grid_item.dart';
import 'package:doctor_app/view/screen/layout/state.dart';
import 'package:doctor_app/view/screen/notifications_screen/notification_screen.dart';
import 'package:doctor_app/view/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayOutStates>
{
  LayoutCubit() : super (LayOutInitialState());
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 0;

  List<Widget> bottomScreen =
      [
         const Home(),
          const Bookings(),
        const NotificationScreen(),
        const settings(),
      ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(LayOutChangeBottomNavState());
  }



}