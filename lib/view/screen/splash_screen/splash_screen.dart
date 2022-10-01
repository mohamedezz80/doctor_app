import 'dart:async';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/token.dart';
import 'package:doctor_app/main.dart';
import 'package:doctor_app/view/widget/auth/is_logined.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    super.initState();
    notificationInit();
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      navigateAndFinish(context, const IsLogined());
    });
  }

  void notificationInit()
  {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode, // id
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: AppColor.primaryColor,
              playSound: true,
              icon: "@drawable/ic_stat_volunteer_activism",
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("A new onMessageOpenedApp event was published !");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body!),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }

  // String? token = await FirebaseMessaging.instance.getToken();

  // postData() async
  // {
  //   try {
  //     var response =
  //     await http.post(
  //         Uri.parse("https://D3mk.com/manshy.php"),
  //         body: {"token": ''}
  //     );
  //     print(response.body);
  //   }catch (e){
  //     print(e);
  //   }
  // }

  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  // firebaseMessaging.getToken().then(String token){
  //   assert(token != null);
  //   setState(() {
  //     mytoken = "Push Messaging token : $token";
  //   });
  //   print(mytoken);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Doctor"),
          ],
        ),
      ),
    );
  }
}

//There was an error publishing the campaign: target_time
// for running campaigns should be at
// least 10seconds into the future

//esLObiumQDqMJbq_RrGwoQ:APA91bHSgkzCc--FyXkkM_KvO2QmmEA6oVBSa1nr8w50m03lRw46wfd-dJPPB5bFcLrOAkSACh48Bq0Hgz6ufXB_DsClc_tsM8EfzNZW9VVXzEiJHiPwGqaY0MCVjH-rmfGfIss6IJj1
