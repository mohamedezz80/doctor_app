

import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/booking_screens/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';


class BookingCubit extends Cubit<BookingStates>
{
  BookingCubit() : super (BookingInitialState());
  static BookingCubit get(context) => BlocProvider.of<BookingCubit>(context);

  DateTime dateTime = DateTime.now();
  DateTime dateTimeConfirm = DateTime.now();
  DateTime dateTimee = DateTime.now();
  var dateNow = Jiffy().format('MMM yyyy');
  var jiffyName = Jiffy()
      .startOf(Units.DAY);
  var jiffyNum = Jiffy()
      .startOf(Units.DAY);
}