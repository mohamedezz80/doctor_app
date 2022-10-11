import 'dart:async';
import 'dart:convert';
import 'package:doctor_app/core/const/token.dart';
import 'package:doctor_app/models/booking_model.dart';
import 'package:doctor_app/models/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<DateTime?> sendValue(var value) async {
  print('the data is succifully');
  http.Response response = await http.post(
    Uri.parse("https://D3mk.com/manshy.php"),
    body: {
      'date': value.toString(),
    },
  );
}

// var name;
// var name = jsonDecode(response.body)['info']['name'];
// void manshy () async
// {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   name = pref.setString('name', value)
//   Map json = jsonDecode(jsonString);
//   String user = jsonEncode(UserModel.fromJson(json));
//   pref.setString('userData', user);
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   Map json = jsonDecode(pref.getString('userData'));
//   var user = UserModel.fromJson(json);
// }



// A function that converts a response body into a List<Photo>.



List<BookingModel> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<BookingModel>((json) => BookingModel.fromJson(json))
      .toList();
}
launchUrl(url) async {
  try {
    await canLaunch(url)
        ? await launch(
      url,
      forceWebView: true,
      enableJavaScript: true,
      forceSafariVC: true,
      enableDomStorage: true,
      webOnlyWindowName: '_self',
    )
        : throw ("valid");
    // ignore: empty_catches
  } catch (e) {}
}
