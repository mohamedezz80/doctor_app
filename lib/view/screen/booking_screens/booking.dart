
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/http.dart';
import 'package:doctor_app/models/booking_model.dart';
import 'package:doctor_app/view/screen/booking_screens/Success_booking.dart';
import 'package:doctor_app/view/screen/booking_screens/booking.dart';
import 'package:doctor_app/view/screen/booking_screens/cubit.dart';
import 'package:doctor_app/view/screen/booking_screens/states.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'grid_item.dart';

// class BookingModel {
//   final String id ;
//   final String date ;
//   final String time ;
//   final String availability ;
//
//   BookingModel({
//     required  this.id,
//     required  this.date,
//     required this.time,
//     required this.availability
//   });
//
//   factory BookingModel.fromJson(Map<String, dynamic> json)
//   {
//     return BookingModel(
//       id: json['id'] as String,
//       date: json['time'] as String,
//       time: json['title'] as String,
//       availability: json['body'] as String,
//     );
//   }
//
// }
//late final List<BookingModel> booking;
class Bookings extends StatefulWidget {
  const Bookings({
    Key? key,
  }) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: BlocConsumer<BookingCubit, BookingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BookingCubit cubit = BookingCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: double.infinity,
                            child:  ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image: NetworkImage('https://blog.capterra.com/wp-content/uploads/2014/09/bigstock-close-up-of-male-doctor-holdin-47034502.jpg'),
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Container(
                          width: double.infinity,
                          child: CustomButtonAuth(
                            text: "تحديد اليوم",
                            onPressed: () async {
                              Future.delayed(const Duration(milliseconds: 0),
                                      () async {
                                    DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: cubit.dateTime,
                                      firstDate: DateTime(2021),
                                      lastDate: DateTime(2100),
                                    ).then((value) async {
                                      String date = value.toString();
                                      print(date.substring(0, 10));
                                      await sendValue(value);
                                      setState(() {
                                        cubit.dateTime = value as DateTime;
                                      });
                                    });
                                    if (newDate == null) return;

                                    // TimeOfDay? newTime = await showTimePicker(
                                    //   context: context,
                                    //   initialTime: TimeOfDay(
                                    //     hour: dateTime.hour,
                                    //     minute: dateTime.minute,
                                    //   ),
                                    //
                                    // );
                                    // if(newTime == null)return;

                                    final newDateTime = DateTime(
                                      newDate.year,
                                      newDate.month,
                                      newDate.day,
                                      // newTime.hour,
                                      // newTime.minute,
                                    );

                                    setState(() {
                                      cubit.dateTime = newDateTime;
                                    });
                                  });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "${cubit.dateTime.day}-${cubit.dateTime.month}-${cubit.dateTime.year}"),
                            const Spacer(),
                            const Text(
                              'مدة الكشف 20 دقيقة',
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ],
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


