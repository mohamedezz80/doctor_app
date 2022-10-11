import 'dart:async';
import 'dart:convert';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/core/const/token.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//TextEditingController savePhone = phoneController;
var tokenUsed = FirebaseMessaging.instance.getToken();

Future<List<NotificationModel>> fetchData(context) async {
  LoginCubit cubit = LoginCubit.get(context);
  final response =
  await http.get(Uri.parse("https://D3mk.com/manshy.php?noti=ok&phone=${cubit.phoneController.text}"));
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
    required this.id,
    required this.time,
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
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0066D9),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              height: hight/4,
              width: width/3,
              margin: EdgeInsets.only(
                top: hight / 300,
                right: width / 50,
                left: width / 3,
                bottom: hight / 15,
              ),
              child: Image.asset(
                AppImageAsset.logoo,
                fit: BoxFit.contain,
                //scale: .2,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              builder: (BuildContext context, ScrollController controller){
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            FutureBuilder<List<NotificationModel>>(
                              future: fetchData(context),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        Icon(
                                          Icons.close_rounded,
                                          size: 150,
                                          color: AppColor.primaryColor,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height/10,
                                        ),
                                        const Text('لست متصل بالانترنت'),
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
                                            setState(() {
                                              FutureBuilder<List<NotificationModel>>(
                                                future: fetchData(context),
                                                builder: (context, snapshot)
                                                {
                                                  if (snapshot.hasError)
                                                  {
                                                    return  Center(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children:
                                                        [
                                                          Icon(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
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
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  future: fetchData(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return  Center(
                        child: Column(
                          children:
                          [
                            Icon(
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
      child: Column(
        children: [
          SizedBox(
            height: hight/35,
          ),
          const Text(
            'Notification',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: hight/50,
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.notification.length,
            itemBuilder: (context, index){
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height/6.5,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Container(
                              width: MediaQuery.of(context).size.width/1.6,
                              height: MediaQuery.of(context).size.height/20,
                              child: const Text(
                                // widget.cubit.title.toString(),
                                ' Dr Maher Mahmoud clinics',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.6,
                              height: MediaQuery.of(context).size.height/20,
                              child: Text(
                                //widget.cubit.body.toString(),
                                widget.notification[index].body,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              //widget.cubit.body.toString(),
                              widget.notification[index].time,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () async
                          {
                            // deleteNotification(context,
                            //     {
                            //   'id' : widget.notification[index].id,
                            //     }
                            // );
                            //LoginCubit cubit = LoginCubit.get(context);
                            await http.delete(
                              Uri.parse("https://d3mk.com/manshy.php?delet=${widget.notification[index].id}"),
                              body: {
                                'id' : widget.notification[index].id,
                              },
                            );

                            print(widget.notification[index].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: AppColor.primaryColor,
                            size: 25,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                // child: Container(
                //   height: 0.2,
                //   color: Colors.black87,
                // ),
              );
            },
          ),
        ],
      ),
    );
  }

}
// Future<http.Response> deleteNotification(Object? body,context) async
// {
//   LoginCubit cubit = LoginCubit.get(context);
//   final http.Response response = await http.delete(
//       Uri.parse("https://d3mk.com/manshy.php?delet=${widget.notification[index].id}"),
//      body: body,
//   );
//   return response;
// }

