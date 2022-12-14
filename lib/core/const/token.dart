import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingHelper {
  static Future<String?> getToken() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    return await FirebaseMessaging.instance.getToken();

  }
}

String token = FirebaseMessaging.instance.getToken().toString();
class Token {
  Future<String?> getToken() async
  {
    await FirebaseMessaging.instance.getToken().then((token) => print(token));
  }
}
IconData suffix = Icons.visibility;
bool isShowPass = true;
showPass()
{
  isShowPass = !isShowPass;
  suffix = isShowPass? Icons.visibility : Icons.visibility_off;
}



class Session
{
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();

  Future<String?> sessionToken() async =>
      await FirebaseMessaging.instance.getToken().then(
            (token) => token,
    );
}
