// import 'package:doctor_app/core/const/color.dart';
// import 'package:doctor_app/core/const/http.dart';
// import 'package:doctor_app/models/booking_model.dart';
// import 'package:doctor_app/view/screen/booking_screens/Success_booking.dart';
// import 'package:doctor_app/view/screen/booking_screens/booking_screen.dart';
// import 'package:doctor_app/view/screen/booking_screens/cubit.dart';
// import 'package:doctor_app/view/screen/booking_screens/states.dart';
// import 'package:doctor_app/view/widget/navigate_finish.dart';
// import 'package:http/http.dart' as http;
// import 'package:doctor_app/view/widget/auth/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class ConfirmBookingScreen extends StatefulWidget {
//   const ConfirmBookingScreen({
//     super.key, required this.booking,
//   });
//
//   final List<BookingModel> booking;
//   @override
//   State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
// }
//
// class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BookingCubit(),
//       child: BlocConsumer<BookingCubit, BookingStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           BookingCubit cubit = BookingCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColor.primaryColor,
//               leading: Builder(
//                 builder: (BuildContext context) {
//                   return IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       size: 25,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                       },
//                     //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//                   );
//                 },
//               ),
//               title: const Text('Doctor'),
//             ),
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height / 5,
//                       ),
//                       CustomButtonAuth(
//                         text: "اعد تحديد اليوم",
//                         onPressed: () async {
//                           Future.delayed(const Duration(milliseconds: 0),
//                                   () async {
//                                 DateTime? newDate = await showDatePicker(
//                                   context: context,
//                                   initialDate: cubit.dateTimeConfirm,
//                                   firstDate: DateTime(2021),
//                                   lastDate: DateTime(2100),
//                                 );
//                                 if (newDate == null) return;
//
//                                 final newDateTime = DateTime(
//                                   newDate.year,
//                                   newDate.month,
//                                   newDate.day,
//                                   // newTime.hour,
//                                   // newTime.minute,
//                                 );
//
//                                 setState(() {
//                                   cubit.dateTimeConfirm = newDateTime;
//                                 });
//                               });
//                         },
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height / 40,
//                       ),
//                       FutureBuilder<List<BookingModel>>(
//                         future: fetchData(context),
//                         builder: (context, snapshot){
//                           if(snapshot.hasError){
//                             return Text('no');
//                           } else if(snapshot.hasData){
//                             return Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               color: AppColor.primaryColor,
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height / 5,
//                                 width: MediaQuery.of(context).size.width / 1,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       "هل تريد تاكيد حجز",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${cubit.dateTimeConfirm.day}-${cubit.dateTimeConfirm.month}-${cubit.dateTimeConfirm.year }-${BookingModel().time}",
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     const Text(
//                                       "مع الطبيب : اضغط تاكيد الحجز",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           } else {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),
//                       const Spacer(),
//                       Container(
//                         width: MediaQuery.of(context).size.width / 1,
//                         child: CustomButtonAuth(
//                           onPressed: () async
//                           {
//                             Future.delayed(const Duration(milliseconds: 0),
//                                     () async {
//                                   http.Response response = await http.post(
//                                     Uri.parse("https://egyptdogs.com/app/apitimeset.php"),
//                                     body: {
//                                       'date': cubit.dateTimeConfirm.toString(),
//                                     },
//                                   );
//                                   print(response.body);
//                                   if (response.body == "ok confirm") {
//                                     print("Correct");
//                                     navigateAndFinish(context, const SuccessBooking());
//                                   } else {
//                                     print("not Correct");
//                                     // ScaffoldMessenger.of(context).showSnackBar(
//                                     //     const SnackBar(
//                                     //         content: Text(
//                                     //             "اعد تحديد الحجز")));
//                                     navigateAndFinish(context, const SuccessBooking());
//                                   }
//
//                                 });
//                           },
//                           text: 'تاكيد الحجز',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
