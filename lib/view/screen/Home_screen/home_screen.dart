
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/notifications_screen/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notifications_screen/cubit.dart';

class Home extends StatelessWidget {
   const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NotificationCubit(),
        child: BlocConsumer<NotificationCubit, NotificationStates>(
          listener: (context, state) {},
          builder: (context, state)
          {
            return Scaffold(
              backgroundColor: AppColor.backGround,
              body: SafeArea(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height:
                                      MediaQuery.of(context).size.height / 5,
                                      width:
                                      MediaQuery.of(context).size.width / 2.7,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Image(
                                          image: NetworkImage(
                                              'https://blog.capterra.com/wp-content/uploads/2014/09/bigstock-close-up-of-male-doctor-holdin-47034502.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 40,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          child: const Text(
                                            'Dr. Fred Mask',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 10),
                                          child: const Text(
                                            'Heart surgen',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 15),
                                          child: const Text(
                                            'Rating: 4.8',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 15,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 4.5,
                          child:  CircleAvatar(
                            backgroundColor: AppColor.backGround,
                            radius: 80,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Mohamed Mohamed Mohamed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Age : 23',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/6.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        right: 16,
                        left: 16,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height/6,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.primaryColor,
                              boxShadow: const[
                                BoxShadow(
                                  blurRadius: 30,
                                  offset: Offset(-50, -50),
                                  // color: Color(0xFFA7A9AF),
                                  color: Colors.white,
                                ),
                                BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(-28, -28),
                                  // color: Color(0xFFA7A9AF),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Row(
                                  children: const[
                                     Text(
                                        'single',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.backGround,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite,
                                      color: AppColor.backGround,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height/50,
                                ),
                                Row(
                                  children: const[
                                     Text(
                                      'Mansoura',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.backGround,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.holiday_village,
                                      color: AppColor.backGround,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height/6,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.primaryColor,
                              boxShadow: const[
                                BoxShadow(
                                  blurRadius: 30,
                                  offset: Offset(-5, -5),
                                  // color: Color(0xFFA7A9AF),
                                  color: Colors.yellow,

                                ),
                                BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(-5, -5),
                                  // color: Color(0xFFA7A9AF),
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Patient\'s disease record',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.backGround,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}