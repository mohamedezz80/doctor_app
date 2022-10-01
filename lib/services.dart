//
//
// import 'package:dio/dio.dart';
// import 'package:doctor_app/models/notification_model.dart';
//
//
// final data = {
//   "to": "${NotificationModel.fromJson(data).token}",
//   "notification": {
//     "body": "Order",
//     "title": "Order Title",
//     "sound": "default"
//   },
//   "android": {
//     "priority": "HIGH",
//     "notification": {
//       "notification_priority": "PRIORITY_HIGH",
//       "sound": "default",
//       "default_sound": true,
//       "default_vibrate_timings": true,
//       "default_light_settings": true,
//     },
//   },
//   "data": {
//     "type": "order",
//     "id": "87",
//     "click_action": "FLUTTER_NOTIFICATION_CLICK",
//   }
// };
// DioHelper().post(path: 'fcm/send', data: data).then((value) {
// if (value.statusCode == 200) {
// // do action
// }
// });
//
// Future<Response> postToken({
// required path,
// required Map<String, dynamic> data,
// Map<String, dynamic>? query,
// }) async {
// return await _dio!.post(
//     path,
//     queryParameters: query,
//     data: data,
// );
// }
//
//
// headers:
// {
// "Authorization":"key=${ServerKey}",
// "Content-Type":"application/json"
// }





