
//
// import 'package:dio/dio.dart';
// import 'package:doctor_app/models/notification_model.dart';
//
// NotificationModel notificationModels = NotificationModel();
//
// var dio = Dio();
// void getNotifications() async
// {
//   Response response = await dio.get(
//     'https://d3mk.com/apinew.php',
//     //queryParameters: {'id': 12, 'name': 'wendu'},
//   );
//   notificationModels = NotificationModel.fromJson(response.data);
//   print(notificationModels.title!.length);
//   print(response.data.toString());
// }