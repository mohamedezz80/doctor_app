
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Person extends StatefulWidget {
   const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {

  void checkConnectivity() async
  {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
  }
  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state)
          {
            return StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                LoginCubit cubit = LoginCubit.get(context);
                double hight = MediaQuery.of(context).size.height;
                double width = MediaQuery.of(context).size.width;
                SharedPreferences.getInstance().then((sharedRemove)
                {
                  var shared = sharedRemove.getString("username");
                });
                cubit.sharedPrefName();
                cubit.sharedPrefAge();
                return Scaffold(
                  backgroundColor: Color(0xff0066D9),
                  body:snapshot.data == ConnectivityResult.none
                      ? const Center(child: Text('لست متصل بالانترنت'))
                      : SafeArea(
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
                              //width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                 // bottomRight: Radius.circular(13),
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
                                  controller: controller,
                                  physics: const ClampingScrollPhysics(),
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height / 35,
                                        ),
                                        const Text(
                                          'Person Details',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height / 35,
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 3,
                                          shadowColor: Colors.black87,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 35,
                                                  backgroundColor: AppColor.backGround,
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      AppImageAsset.doctorphoto,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width/20,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children:  [
                                                    const Text(
                                                      'Dr. Maher Mahmoud',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: MediaQuery.of(context).size.height/60,
                                                    ),
                                                    const Text(
                                                      '01155555555',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height / 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:  [
                                                const Text(
                                                  "Name",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: hight/150,
                                                ),
                                                state is NameLoaded ?Container(
                                                  width: width/2.5,
                                                  child:  Text(
                                                    cubit.sharedName.toString(),
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ):const Text('Loading...'),
                                              ],
                                            ),
                                            //Spacer(),
                                            SizedBox(
                                              width: width/4.5,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children:  [
                                                const Text(
                                                  "Age",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: hight/150,
                                                ),
                                                state is NameLoaded ?Text(
                                                  cubit.sharedAge.toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                                ):const Text('Loading...'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: hight/55,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   crossAxisAlignment: CrossAxisAlignment.start,
                                        //   children: [
                                        //     Column(
                                        //       mainAxisAlignment: MainAxisAlignment.start,
                                        //       crossAxisAlignment: CrossAxisAlignment.start,
                                        //       children:  [
                                        //         const Text(
                                        //           "Phone",
                                        //           style: TextStyle(
                                        //             fontWeight: FontWeight.w500,
                                        //             fontSize: 14,
                                        //             color: Colors.black45,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: hight/150,
                                        //         ),
                                        //         Container(
                                        //           width: width/3,
                                        //           child: const Text(
                                        //             // "${cubit.phoneController.text}",
                                        //             "01155555555",
                                        //             style: TextStyle(
                                        //               fontWeight: FontWeight.w500,
                                        //               fontSize: 15,
                                        //               color: Colors.black87,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //
                                        //       ],
                                        //     ),
                                        //     //Spacer(),
                                        //     SizedBox(
                                        //       width: width/4,
                                        //     ),
                                        //     Column(
                                        //       crossAxisAlignment: CrossAxisAlignment.start,
                                        //       mainAxisAlignment: MainAxisAlignment.start,
                                        //       children:  [
                                        //         const Text(
                                        //           "Status",
                                        //           style: TextStyle(
                                        //             fontWeight: FontWeight.w500,
                                        //             fontSize: 14,
                                        //             color: Colors.black54,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: hight/150,
                                        //         ),
                                        //         const Text(
                                        //           "08:15 pm",
                                        //           style: TextStyle(
                                        //             fontWeight: FontWeight.w500,
                                        //             fontSize: 16,
                                        //             color: Colors.black87,
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: hight/35,
                                        ),
                                        Column(
                                          children:
                                          [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "number of visits : 0",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: hight/70,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Card(
                                                color: Colors.white,
                                                elevation: 3,
                                                shadowColor: Colors.black87,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  child: ListTile(
                                                    leading: CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor: AppColor.backGround,
                                                      child: ClipOval(
                                                        child: Icon(
                                                          Icons.menu_book,
                                                          color: AppColor.primaryColor,
                                                          size: 37,
                                                        ),
                                                      ),
                                                    ),
                                                    title: Row(
                                                      children: [
                                                        const Text(
                                                          'Available',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width/50,
                                                        ),
                                                        const CircleAvatar(
                                                          radius: 5,
                                                          backgroundColor: Colors.red,
                                                        ),
                                                      ],
                                                    ),
                                                    subtitle: const Text(
                                                      '25-10-2022  8:15 pm',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
            );
          },
        ),
    );
  }

  static void reload() async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    var shared =   pref.getString('userData');

  }

}

// Stack(
// alignment: AlignmentDirectional.bottomCenter,
// clipBehavior: Clip.none,
// children: [
// Container(
// height: MediaQuery.of(context).size.height / 3,
// decoration: const BoxDecoration(
// color: Colors.teal,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(30),
// bottomRight: Radius.circular(30))),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 8.0,
// vertical: 8.0,
// ),
// child: Container(
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height:
// MediaQuery.of(context).size.height / 5,
// width:
// MediaQuery.of(context).size.width / 2.7,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: const Image(
// image: NetworkImage(
// 'https://blog.capterra.com/wp-content/uploads/2014/09/bigstock-close-up-of-male-doctor-holdin-47034502.jpg'),
// fit: BoxFit.fill,
// ),
// )),
// SizedBox(
// width: MediaQuery.of(context).size.width / 40,
// ),
// Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: const EdgeInsets.only(top: 20),
// child: const Text(
// 'Dr. Fred Mask',
// style: TextStyle(
// color: Colors.white,
// fontSize: 22,
// fontFamily: 'Roboto',
// fontWeight: FontWeight.w700,
// ),
// ),
// ),
// Container(
// margin: const EdgeInsets.only(top: 10),
// child: const Text(
// 'Heart surgen',
// style: TextStyle(
// color: Colors.white,
// fontSize: 15,
// fontFamily: 'Roboto',
// fontWeight: FontWeight.w300,
// ),
// ),
// ),
// Container(
// margin: const EdgeInsets.only(top: 15),
// child: const Text(
// 'Rating: 4.8',
// style: TextStyle(
// color: Colors.yellow,
// fontSize: 15,
// fontFamily: 'Roboto',
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ],
// ),
// )
// ],
// ),
// ),
// ),
// ),
// Positioned(
// top: MediaQuery.of(context).size.height / 4.5,
// child:  CircleAvatar(
// backgroundColor: AppColor.backGround,
// radius: 80,
// child: Container(
// padding: EdgeInsets.symmetric(vertical: 5),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: const [
// Text(
// 'Mohamed Mohamed Mohamed',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20,
// color: AppColor.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// Text(
// 'Age : 23',
// style: TextStyle(
// fontSize: 20,
// color: AppColor.black,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ],
// ),

