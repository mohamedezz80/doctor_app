import 'dart:async';
import 'dart:convert';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/token.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//TextEditingController savePhone = phoneController;
var tokenUsed = FirebaseMessaging.instance.getToken();

Future<List<NotificationModel>> fetchData(http.Client client) async {
  final response = await client
      .get(Uri.parse("https://d3mk.com/apinew.php?phone=${phoneController.text}"));
  return compute(parseData, response.body);
}

// A function that converts a response body into a List<Photo>.
List<NotificationModel> parseData(String responseBody)
{
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
}

class NotificationModel {
  final String id ;
  final String time ;
  final String title ;
  final String body ;

  NotificationModel({
    required  this.id,
    required  this.time,
    required this.title,
    required this.body});

  factory NotificationModel.fromJson(Map<String, dynamic> json)
  {
    return NotificationModel(
      id: json['id'] as String,
      time: json['time'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['time'] = time;
  //   data['title'] = title;
  //   data['body'] = body;
  //   return data;
  // }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<NotificationModel>>(
          future: fetchData(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Icon(
                      Icons.close_rounded,
                      size: 150,
                      color: AppColor.primaryColor,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/10,
                    ),
                    const Text('Notification is empty'),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              print("data is : ${snapshot.data.toString()}");
              return RefreshIndicator(
                  child: DataList(notification: snapshot.data!),
                onRefresh: () async
                {
                    return Future.delayed(
                        const Duration(seconds: 1),
                            () {
                          print("kkk");
                          setState(() {
                            FutureBuilder<List<NotificationModel>>(
                              future: fetchData(http.Client()),
                              builder: (context, snapshot)
                              {
                                if (snapshot.hasError)
                                {
                                  return  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        const Icon(
                                          Icons.close_rounded,
                                          size: 150,
                                          color: AppColor.primaryColor,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height/10,
                                        ),
                                        const Text('No Data'),
                                      ],
                                    ),
                                  );
                                } else if (snapshot.hasData) {
                                  print("data is refresh : ${snapshot.data.toString()}");
                                  return DataList(notification: snapshot.data!);
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            );
                          });
                        }
                    );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class DataList extends StatefulWidget {
  const DataList({super.key, required this.notification});
  final List<NotificationModel> notification;

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: () async
      {
        return Future.delayed(
            const Duration(seconds: 2),
            () {
              print("kkk");
              setState(() {
                FutureBuilder<List<NotificationModel>>(
                  future: fetchData(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return  Center(
                        child: Column(
                          children:
                          [
                            const Icon(
                              Icons.close_rounded,
                              size: 150,
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/5,
                            ),
                            const Text('No Data'),
                          ],
                        ),
                      );
                    } else if (snapshot.hasData) {
                      print("data is refresh : ${snapshot.data.toString()}");
                      return DataList(notification: snapshot.data!);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              });

            }
        );
      },
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.notification.length,
        itemBuilder: (context, index){
          return Container(
            //height: MediaQuery.of(context).size.height/7.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Column(
                    children:
                    [
                      Container(
                        width: MediaQuery.of(context).size.width/1.3,
                        child: Text(
                          // widget.cubit.title.toString(),
                          widget.notification[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/100,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.3,
                        child: Text(
                          //widget.cubit.body.toString(),
                          widget.notification[index].body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: ()
                    {
                      setState(() {
                        deleteNotification({
                          'id' : widget.notification[index].id,
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColor.primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              height: 0.2,
              color: Colors.black87,
            ),
          );
        },
      ),
    );
  }
}
Future<http.Response> deleteNotification(Object? body) async {
  final http.Response response = await http.delete(
      Uri.parse("https://d3mk.com/apinew.php?phone=${phoneController.text}"),
     body: body,
  );
  return response;
}



