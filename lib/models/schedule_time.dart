import 'dart:convert';

import 'package:flutter/material.dart';
class ScheduleTime
{
   String? day;
   String? timeStart;
   String? timeEnd;
   String? available;

  ScheduleTime({required this.day, required this.available, required this.timeEnd, required this.timeStart});

  ScheduleTime.fromJson(Map<String,dynamic> json )
  {
    day= json['dayname'];
    timeStart= json['time-start'];
    timeEnd= json['time-end'];
    available= json['available'];
  }
   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data =  <String, dynamic>{};
     data['day'] = day;
     data['timeStart'] = timeStart;
     data['timeEnd'] = timeEnd;
     data['available'] = available;
     return data;
   }
}
