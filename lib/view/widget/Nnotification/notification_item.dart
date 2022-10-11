
import 'dart:convert';
import 'package:doctor_app/core/const/api.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/models/notification_model.dart';
import 'package:doctor_app/view/screen/notifications_screen/cubit.dart';
import 'package:doctor_app/view/screen/notifications_screen/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationItem extends StatefulWidget {
  //NotificationModel cubit;
   const NotificationItem({Key? key}) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {

  @override
  void initState() {
    getApi();
    super.initState();
  }

  var notificationList = <NotificationModel>[];
  getApi()
  {
    CallApi().getData().then((response){
      Iterable list = jsonDecode(response.body);
      notificationList = list.map((model) => NotificationModel.fromJson(model)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: BlocConsumer<NotificationCubit,NotificationStates>(
        listener: (context, state) {},
        builder: (context, state){

          return Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: notificationList.isEmpty ?
                  const CircularProgressIndicator()
                  : Row(
                children: notificationList.map((notificationList) {
                return GestureDetector(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        Column(
                          children:
                          [
                            Text(
                             // widget.cubit.title.toString(),
                              notificationList.title.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                            Text(
                              //widget.cubit.body.toString(),
                              notificationList.body.toString(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.delete,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                }).toList(),
              ),
            ),
          );
          },
        ),
    );
  }
}
