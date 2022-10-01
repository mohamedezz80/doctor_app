import 'dart:async';
import 'dart:convert';
import 'package:doctor_app/core/const/token.dart';
import 'package:doctor_app/models/booking_model.dart';
import 'package:doctor_app/models/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Future<DateTime?> sendValue(var value) async {
  print('the data is succifully');
  await http.post(
    Uri.parse("https://egyptdogs.com/app/apitimeset.php"),
    body: {
      'date': value.toString(),
    },
  );
}

Future<List<BookingModel>> fetchData() async {
  final response =
      await http.get(Uri.parse("https://egyptdogs.com/app/apitimeset.php"));
  if (response.statusCode == 200) {
    print('is');
    return compute(parseData, response.body);
  } else {
    throw Exception('No Data');
  }
}

// A function that converts a response body into a List<Photo>.
List<BookingModel> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<BookingModel>((json) => BookingModel.fromJson(json))
      .toList();
}
