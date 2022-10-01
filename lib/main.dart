
import 'package:doctor_app/app_router.dart';
import 'package:doctor_app/core/const/bloc_observer.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/network/dio_helper.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const AndroidNotificationChannel channel =AndroidNotificationChannel(
  "high_importance_channel",
  "High Importance Notifications",
  description:  "This channel is used for important notifications.",
  importance: Importance.high,
  playSound: true,
  enableVibration: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message)
async{
  await Firebase.initializeApp();
  print("A bg message just show up : ${message.messageId}");
}

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
  .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await Hive.initFlutter();
  DioHelper.init();
  BlocOverrides.runZoned(
        () {
      // Use cubits...
      runApp(MyApp(appRouter: AppRouter(),));
    },
    blocObserver: MyBlocObserver(),
  );
  runApp( MyApp(
    appRouter: AppRouter(),
  )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
    );
  }
}
