
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/http.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/models/booking_model.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/booking_screens/Success_booking.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:doctor_app/view/widget/navigate_finish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<BookingModel>> fetchData(context) async {
  LoginCubit cubit = LoginCubit.get(context);
  final response =
  await http.get(Uri.parse("https://D3mk.com/manshy.php?seetime=ok&datetime=${cubit.dateTime}"));
  if (response.statusCode == 200) {
    print('${cubit.dateTime.toString()}');

    return compute(parseData, response.body);
  } else {
    throw Exception('No Data');
  }
}

enum ToggleTypeEnum {cash, visa, bank}

class Booking extends StatefulWidget {
  const Booking({
    Key? key,
  }) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime dateTime = DateTime.now();
  int isValue = 1;
  static var phone ;

  void checkConnectivity() async
  {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
  }
  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }
  ToggleTypeEnum? toggleTypeEnum;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              double hight = MediaQuery.of(context).size.height;
              double width = MediaQuery.of(context).size.width;
              return Scaffold(
                backgroundColor: Color(0xff0066D9),
                body: snapshot.data == ConnectivityResult.none
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
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
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
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      const Text(
                                        'Select Appointment',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      Card(
                                        color: Colors.white,
                                        elevation: 3,
                                        shadowColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
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
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: CustomButtonAuth(
                                          text: "Select Date",
                                          onPressed: () async {
                                            Future.delayed(const Duration(milliseconds: 0),
                                                    () async {
                                                  DateTime? newDate = await showDatePicker(
                                                    context: context,
                                                    initialDate: cubit.dateTime,
                                                    firstDate: DateTime(2021),
                                                    lastDate: DateTime(2100),
                                                  ).then((value) async {
                                                    String date = value.toString();
                                                    print(date.substring(0, 10));
                                                    await sendValue(value);
                                                    setState(() {
                                                      cubit.dateTime = value as DateTime;
                                                    });
                                                  });
                                                  if (newDate == null) return;

                                                  // TimeOfDay? newTime = await showTimePicker(
                                                  //   context: context,
                                                  //   initialTime: TimeOfDay(
                                                  //     hour: dateTime.hour,
                                                  //     minute: dateTime.minute,
                                                  //   ),
                                                  //
                                                  // );
                                                  // if(newTime == null)return;

                                                  final newDateTime = DateTime(
                                                    newDate.year,
                                                    newDate.month,
                                                    newDate.day,
                                                    // newTime.hour,
                                                    // newTime.minute,
                                                  );

                                                  setState(() {
                                                    cubit.dateTime = newDateTime;
                                                  });
                                                });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "${cubit.dateTime.day}-${cubit.dateTime.month}-${cubit.dateTime.year}"),
                                          const Spacer(),
                                          const Text(
                                            'مدة الكشف 20 دقيقة',
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Select Time',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      FutureBuilder<List<BookingModel>>(
                                        future: fetchData(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            print('$snapshot');
                                            print('Error ${snapshot.error}');
                                            return const Center(
                                              child: Text(
                                                  'لست متصل بالانترنت',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            );
                                          } else if (snapshot.hasData)
                                          {
                                            return RefreshIndicator(
                                              child: GridView.count(
                                                shrinkWrap: true,
                                                //physics: const NeverScrollableScrollPhysics(),
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 7,
                                                mainAxisSpacing: 1,
                                                children: List.generate(
                                                  snapshot.data!.length,

                                                      (index) => InkWell(
                                                    onTap: () async {
                                                      if (snapshot.data![index].availability == 'true') {
                                                        // await http.post(
                                                        //   Uri.parse("https://D3mk.com/manshy.php"),
                                                        //   body: {
                                                        //     'time': snapshot.data![index].time.toString(),
                                                        //   },
                                                        // );
                                                        // navigateTo(context,   DoctorDetailPage(booking: widget.booking,));
                                                        cubit.timeMorning = snapshot.data![index].time.toString();
                                                        print(cubit.timeMorning);
                                                        setState(() {
                                                          cubit.isSelected = index;
                                                        });
                                                      } else {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                "هذا الوقت ليس متاح",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            ));
                                                      }
                                                    },
                                                    child: snapshot.data![index].availability == 'true'
                                                        ? FittedBox(
                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                      child: Container(
                                                        height: hight/30,
                                                        padding: const EdgeInsets.symmetric(horizontal: 3,),
                                                        decoration: BoxDecoration(
                                                          color: cubit.isSelected == index ?
                                                          AppColor.primaryColor:Color(0xffE8F5FF),
                                                          borderRadius:
                                                          BorderRadius.circular(18),
                                                        ),
                                                        child: Center(
                                                          child: Text("${snapshot.data![index].time}",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              color: cubit.isSelected == index ?
                                                              Colors.white:Colors.black54,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                        : FittedBox(
                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 3,),
                                                        height: hight/30,
                                                        decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                          BorderRadius.circular(18),
                                                        ),
                                                        child: Center(
                                                          child: Text("${snapshot.data![index].time}",
                                                            textAlign: TextAlign.center,
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onRefresh: () async {
                                                return await Future.delayed(
                                                    const Duration(milliseconds: 0), () {
                                                  setState(() {
                                                    GridView.count(
                                                      shrinkWrap: true,
                                                      //physics: const NeverScrollableScrollPhysics(),
                                                      crossAxisCount: 4,
                                                      crossAxisSpacing: 7,
                                                      mainAxisSpacing: 1,
                                                      children: List.generate(
                                                        snapshot.data!.length,

                                                            (index) => InkWell(
                                                          onTap: () async {
                                                            if (snapshot.data![index].availability == 'true') {
                                                              // await http.post(
                                                              //   Uri.parse("https://D3mk.com/manshy.php"),
                                                              //   body: {
                                                              //     'time': snapshot.data![index].time.toString(),
                                                              //   },
                                                              // );
                                                              // navigateTo(context,   DoctorDetailPage(booking: widget.booking,));
                                                              cubit.timeMorning = snapshot.data![index].time.toString();
                                                              print(cubit.timeMorning);
                                                              setState(() {
                                                                cubit.isSelected = index;
                                                              });
                                                            } else {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                  const SnackBar(content: Text("هذا الوقت ليس متاح")));
                                                            }
                                                          },
                                                          child: snapshot.data![index].availability == 'true'
                                                              ? FittedBox(
                                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                                            child: Container(
                                                              height: hight/30,
                                                              padding: const EdgeInsets.symmetric(horizontal: 3,),
                                                              decoration: BoxDecoration(
                                                                color: cubit.isSelected == index ?
                                                                AppColor.primaryColor:Color(0xffE8F5FF),
                                                                borderRadius:
                                                                BorderRadius.circular(18),
                                                              ),
                                                              child: Center(
                                                                child: Text("${snapshot.data![index].time}",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: cubit.isSelected == index ?
                                                                    Colors.white:Colors.black54,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                              : FittedBox(
                                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                                            child: Container(
                                                              padding: const EdgeInsets.symmetric(horizontal: 3,),
                                                              height: hight/30,
                                                              decoration: BoxDecoration(
                                                                color: Colors.red,
                                                                borderRadius:
                                                                BorderRadius.circular(18),
                                                              ),
                                                              child: Center(
                                                                child: Text("${snapshot.data![index].time}",
                                                                  textAlign: TextAlign.center,
                                                                  style: const TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                                });
                                              },
                                            );
                                          } else {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 20,
                                      ),
                                      // const Text(
                                      //   'Night',
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.w500,
                                      //     fontSize: 20,
                                      //     color: Colors.black54,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: MediaQuery.of(context).size.height / 35,
                                      // ),
                                      // FutureBuilder<List<BookingModel>>(
                                      //   future: fetchData(context),
                                      //   builder: (context, snapshot) {
                                      //     if (snapshot.hasError) {
                                      //       print('$snapshot');
                                      //       print('Error ${snapshot.error}');
                                      //       return Center(
                                      //         child: Text('Error ${snapshot.error}'),
                                      //       );
                                      //     } else if (snapshot.hasData) {
                                      //       return RefreshIndicator(
                                      //         child: GridView.count(
                                      //           shrinkWrap: true,
                                      //           //physics: const NeverScrollableScrollPhysics(),
                                      //           crossAxisCount: 4,
                                      //           crossAxisSpacing: 1.0,
                                      //           mainAxisSpacing: 1.0,
                                      //           children: List.generate(
                                      //             snapshot.data!.length,
                                      //
                                      //                 (index) => InkWell(
                                      //               onTap: () async {
                                      //                 if (snapshot.data![index].availability == 'true') {
                                      //                   await http.post(
                                      //                     Uri.parse("https://D3mk.com/manshy.php"),
                                      //                     body: {
                                      //                       'time': snapshot.data![index].time.toString(),
                                      //                     },
                                      //                   );
                                      //                   // navigateTo(context,   DoctorDetailPage(booking: widget.booking,));
                                      //                   cubit.test = snapshot.data![index].time.toString();
                                      //                   print(cubit.test);
                                      //                   setState(() {
                                      //                     cubit.isSelected = index;
                                      //                   });
                                      //                 } else {
                                      //                   ScaffoldMessenger.of(context).showSnackBar(
                                      //                       const SnackBar(content: Text("هذا الوقت ليس متاح")));
                                      //                 }
                                      //               },
                                      //               child: Card(
                                      //                 shape: RoundedRectangleBorder(
                                      //                   borderRadius: BorderRadius.circular(10),
                                      //                 ),
                                      //                 color: cubit.isSelected == index ?AppColor.primaryColor:Colors.white,
                                      //                 child: Container(
                                      //                   height: MediaQuery.of(context).size.height / 40,
                                      //                   width: MediaQuery.of(context).size.width / 5,
                                      //                   child: Column(
                                      //                     crossAxisAlignment: CrossAxisAlignment.center,
                                      //                     mainAxisAlignment: MainAxisAlignment.center,
                                      //                     children: [
                                      //                       Text("${snapshot.data![index].time}"),
                                      //                       // SizedBox(
                                      //                       //   height: MediaQuery.of(context).size.height / 200,
                                      //                       // ),
                                      //                       if (snapshot.data![index].availability == 'true')
                                      //                         const Text(
                                      //                           'متاح',
                                      //                           style: TextStyle(
                                      //                             color: Colors.black,
                                      //                             fontWeight: FontWeight.bold,
                                      //                           ),
                                      //                         )
                                      //                       else
                                      //                         const Text(
                                      //                           'ليس متاح',
                                      //                           style: TextStyle(
                                      //                             fontWeight: FontWeight.bold,
                                      //                           ),
                                      //                         ),
                                      //                     ],
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         onRefresh: () async {
                                      //           return await Future.delayed(
                                      //               const Duration(milliseconds: 0), () {
                                      //             setState(() {
                                      //               GridView.count(
                                      //                 shrinkWrap: true,
                                      //                 //physics: const NeverScrollableScrollPhysics(),
                                      //                 crossAxisCount: 4,
                                      //                 crossAxisSpacing: 1.0,
                                      //                 mainAxisSpacing: 1.0,
                                      //                 children: List.generate(
                                      //                   snapshot.data!.length,
                                      //
                                      //                       (index) => InkWell(
                                      //                     onTap: () async {
                                      //                       if (snapshot.data![index].availability == 'true') {
                                      //                         await http.post(
                                      //                           Uri.parse("https://D3mk.com/manshy.php"),
                                      //                           body: {
                                      //                             'time': snapshot.data![index].time.toString(),
                                      //                           },
                                      //                         );
                                      //                         // navigateTo(context,   DoctorDetailPage(booking: widget.booking,));
                                      //                         cubit.test = snapshot.data![index].time.toString();
                                      //                         print(cubit.test);
                                      //                         setState(() {
                                      //                           cubit.isSelected = index;
                                      //                         });
                                      //                       } else {
                                      //                         ScaffoldMessenger.of(context).showSnackBar(
                                      //                             const SnackBar(content: Text("هذا الوقت ليس متاح")));
                                      //                       }
                                      //                     },
                                      //                     child: Card(
                                      //                       shape: RoundedRectangleBorder(
                                      //                         borderRadius: BorderRadius.circular(10),
                                      //                       ),
                                      //                       color: cubit.isSelected == index ?AppColor.primaryColor:Colors.white,
                                      //                       child: Container(
                                      //                         height: MediaQuery.of(context).size.height / 40,
                                      //                         width: MediaQuery.of(context).size.width / 5,
                                      //                         child: Column(
                                      //                           crossAxisAlignment: CrossAxisAlignment.center,
                                      //                           mainAxisAlignment: MainAxisAlignment.center,
                                      //                           children: [
                                      //                             Text("${snapshot.data![index].time}"),
                                      //                             // SizedBox(
                                      //                             //   height: MediaQuery.of(context).size.height / 200,
                                      //                             // ),
                                      //                             if (snapshot.data![index].availability == 'true')
                                      //                               const Text(
                                      //                                 'متاح',
                                      //                                 style: TextStyle(
                                      //                                   color: Colors.black,
                                      //                                   fontWeight: FontWeight.bold,
                                      //                                 ),
                                      //                               )
                                      //                             else
                                      //                               const Text(
                                      //                                 'ليس متاح',
                                      //                                 style: TextStyle(
                                      //                                   fontWeight: FontWeight.bold,
                                      //                                 ),
                                      //                               ),
                                      //                           ],
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               );
                                      //             });
                                      //           });
                                      //         },
                                      //       );
                                      //     } else {
                                      //       return const Center(
                                      //         child: CircularProgressIndicator(),
                                      //       );
                                      //     }
                                      //   },
                                      // ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                Radio<ToggleTypeEnum>(
                                                  groupValue: toggleTypeEnum,
                                                  value: ToggleTypeEnum.cash,
                                                  onChanged: (value){
                                                    setState(() {
                                                      toggleTypeEnum = value;
                                                    });
                                                  },
                                                ),
                                                const Text(
                                                    'Cash',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width/80,
                                                ),
                                                Radio<ToggleTypeEnum>(
                                                  groupValue: toggleTypeEnum,
                                                  value: ToggleTypeEnum.visa,
                                                  onChanged: (value){
                                                    setState(() {
                                                      toggleTypeEnum = value;
                                                    });
                                                  },
                                                ),
                                                const Text(
                                                    'Visa',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width/80,
                                                ),
                                                Radio<ToggleTypeEnum>(
                                                  groupValue: toggleTypeEnum,
                                                  value: ToggleTypeEnum.bank,
                                                  onChanged: (value){
                                                    setState(() {
                                                      toggleTypeEnum = value;
                                                    });
                                                  },
                                                ),
                                                const Text(
                                                    'Banking',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width/80,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height / 35,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: CustomButtonAuth(
                                          text: 'Booking',
                                          onPressed: () async{
                                            SharedPreferences.getInstance().then((sharedPrefValue) {
                                              setState(() {
                                                phone = sharedPrefValue.getString("phone");
                                                //print("phone : $phone");
                                              });
                                            });
                                            Future.delayed(
                                                Duration(milliseconds: 0),
                                                    () async {
                                                  if(cubit.timeMorning == null){
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(content: Text("اختر الوقت اولا")));
                                                  } else {
                                                    print("${cubit.dateTime.year}-${cubit.dateTime.month}-${cubit.dateTime.day}");
                                                    print(cubit.timeMorning);
                                                    print(toggleTypeEnum.toString());
                                                    http.Response response = await http.post(
                                                      Uri.parse("https://D3mk.com/manshy.php"),
                                                      body: {
                                                        'dateok': "${cubit.dateTime.year}-${cubit.dateTime.month}-${cubit.dateTime.day}",
                                                        'timeok': cubit.timeMorning,
                                                        'phoneuser': phone,
                                                        'pay' : toggleTypeEnum.toString(),
                                                      },
                                                    );
                                                    print(response.body);
                                                    print(phone);
                                                    navigateAndFinish(context, const SuccessBooking());
                                                  }
                                                }
                                            );

                                          },
                                        ),
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
}


