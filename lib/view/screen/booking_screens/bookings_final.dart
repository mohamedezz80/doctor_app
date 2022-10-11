//
//
// import 'package:flutter/material.dart';
//
// class GetAppointment with ChangeNotifier {
//   final String appId, allotedCrew, allotedSlot, usedSlot, totalTimeSlots;
//   final DateTime totalDurationinHr;
//   dynamic availableTimeSlotsFm, currentDate;
//   bool slotAvailable, dayAvailable;
//
//   GetAppointment({
//     required this.appId,
//     required this.allotedCrew,
//     required this.allotedSlot,
//     required this.usedSlot,
//     required this.totalTimeSlots,
//     required this.totalDurationinHr,
//     this.availableTimeSlotsFm,
//     this.currentDate,
//     this.slotAvailable: true,
//     this.dayAvailable: true});
// }
//
// extension on DateTime {
//   DateTime roundDown({Duration delta = const Duration(minutes: 30)}) {
//     return DateTime.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch -
//         this.millisecondsSinceEpoch % delta.inMilliseconds);
//   }
// }
//
// class Appointments with ChangeNotifier {
//   Map<String, GetAppointment> _appointmentList = {};
//
//   Map<String, GetAppointment> get items {
//     return {..._appointmentList};
//   }
//
//   // generateBookingSlots() {
//   //   final endTime = DateTime(now.year, now.month, now.day, 23, 60, now.second);
//   //   final startTime = DateTime(now.year, now.month, now.day, 6, 60, now.second);
//   //   var currentTime = DateTime.now();
//   //   var availableTimeSlots = DateTime.now();
//   //   var currentDate, availableTimeSlotsFm;
//   //   final diff_dy = endTime.difference(startTime).inDays;
//   //   final diff_hr = endTime.difference(startTime).inHours;
//   //
//   //   //List available day from current day
//   //   for (int i = 0; i <= 3; i++) {
//   //     int a = 0;
//   //     if ((diff_hr * 2) <= 0) {
//   //       a = 1;
//   //     }
//   //     currentDate = DateTime.now().add(Duration(days: 1) * (i + a));
//   //   }
//   //
//   //   // List numbers of hours in single day
//   //   final listAllTime = List.generate(diff_hr * 2, (index) {
//   //     final totalDuration = startTime.add(Duration(minutes: 30));
//   //     final totalTimeSlots =
//   //     DateFormat.jm().format(startTime.add(Duration(minutes: 30) * index));
//   //
//   //     if (currentTime.difference(startTime).inHours > 0 &&
//   //         currentTime.isBefore(endTime) &&
//   //         availableTimeSlots.isBefore(endTime)) {
//   //       availableTimeSlots = currentTime.add(Duration(minutes: 30) * index);
//   //       availableTimeSlots.roundDown(delta: Duration(minutes: 30));
//   //       availableTimeSlotsFm = DateFormat.jm()
//   //           .format(availableTimeSlots.roundDown(delta: Duration(minutes: 30)));
//   //       // availableTimeSlots.roundDown();
//   //     }
//   //     _appointmentList.putIfAbsent(
//   //         index.toString(),
//   //             () => GetAppointment(
//   //           appId: index.toString(),
//   //           allotedCrew: "2",
//   //           allotedSlot: "2",
//   //           usedSlot: "2",
//   //           totalTimeSlots: totalTimeSlots,
//   //           totalDurationinHr: totalDuration,
//   //           availableTimeSlotsFm: availableTimeSlotsFm,
//   //           currentDate: currentDate,
//   //         ));
//   //     return {
//   //       'totalDurationinHr': totalDuration,
//   //       'totalTimeSlotsFm': totalTimeSlots,
//   //       'availableTimeSlotsFm': availableTimeSlotsFm,
//   //       'currentDate': currentDate
//   //     };
//   //   });
//   //   // notifyListeners();
//   // }
//   DateTime now = DateTime.now();
//   List<Map<String, dynamic>> get generateBookingSlots {
//     final endTime = DateTime(now.year, now.month, now.day, 23, 60, now.second);
//     final startTime = DateTime(now.year, now.month, now.day, 6, 60, now.second);
//     var currentTime = DateTime.now();
//     var availableTimeSlots = DateTime.now();
//     var currentDate, availableTimeSlotsFm;
//     final diff_dy = endTime.difference(startTime).inDays;
//     final diff_hr = endTime.difference(startTime).inHours;
//
//     //List available day from current day
//     for (int i = 0; i <= 3; i++) {
//       int a = 0;
//       if ((diff_hr * 2) <= 0) {
//         a = 1;
//       }
//       currentDate = DateTime.now().add(Duration(days: 1) * (i + a));
//     }
//
//     // List numbers of hours in single day
//     final listAllTime = List.generate(diff_hr * 2, (index) {
//       final totalDuration = startTime.add(Duration(minutes: 30));
//       final totalTimeSlots =
//       DateFormat.jm().format(startTime.add(const Duration(minutes: 30) * index));
//
//       if (currentTime.difference(startTime).inHours > 0 &&
//           currentTime.isBefore(endTime) &&
//           availableTimeSlots.isBefore(endTime)) {
//         availableTimeSlots = currentTime.add(Duration(minutes: 30) * index);
//         availableTimeSlots.roundDown(delta: Duration(minutes: 30));
//         availableTimeSlotsFm = DateFormat.jm()
//             .format(availableTimeSlots.roundDown(delta: Duration(minutes: 30)));
//         // availableTimeSlots.roundDown();
//       }
//
//       return {
//         'totalDurationinHr': totalDuration,
//         'totalTimeSlotsFm': totalTimeSlots,
//         'availableTimeSlotsFm': availableTimeSlotsFm,
//         'currentDate': currentDate
//       }
//     });
//     return listAlltime.toList();
//   }
//   List<Map<String, dynamic>> get totalDurationinHr{
//     final totalDurationinHr = List.generate(generateBookingSlots.length, (index) {
//       return {'totalDurationinHr' :generateBookingSlots[index]['totalDurationinHr'] }
//     }
//
//   }