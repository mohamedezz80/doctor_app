import 'package:doctor_app/models/booking_model.dart';
import 'package:doctor_app/view/screen/Home_screen/home_screen.dart';
import 'package:doctor_app/view/screen/booking_screens/Success_booking.dart';
import 'package:doctor_app/view/screen/booking_screens/confirm_booking.dart';
import 'package:doctor_app/view/screen/booking_screens/booking_screen.dart';
import 'package:doctor_app/view/screen/layout/doctor_layout.dart';
import 'package:doctor_app/view/screen/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/screen/notifications_screen/notification_screen.dart';

class AppRouter {

late final List<BookingModel> booking ;

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/layout':
        return MaterialPageRoute(
          builder: (_) => DoctorLayOut(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => Home(),
        );

      case '/booking':
        return MaterialPageRoute(
          builder: (_) => Booking(),
        );

      case '/confirm':
        return MaterialPageRoute(
          builder: (_) => ConfirmBookingScreen(booking: booking,),
        );

      case '/Success':
        return MaterialPageRoute(
          builder: (_) => SuccessBooking(),
        );
      case '/notification':
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
        );
    }
  }
}