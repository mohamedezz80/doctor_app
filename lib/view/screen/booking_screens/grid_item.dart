import 'dart:ui';

import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/http.dart';
import 'package:doctor_app/models/booking_model.dart';
import 'package:doctor_app/view/widget/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';

class DoctorDetailPage extends StatefulWidget {
  final List<BookingModel> booking;

  const DoctorDetailPage({super.key, required this.booking});
  @override
  State<StatefulWidget> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    var isSelected = true;
    var mycolor= const Color(0xffEEEEEE);
    void toggleSelection() {
      setState(() {
        if (isSelected) {
          mycolor= Colors.white;
          isSelected = false;
        } else {
          mycolor= AppColor.primaryColor;
          isSelected = true;
        }
      });
    }
    Color unSelected = const Color(0xffEEEEEE);
    final List<Map> color =
        List.generate(6, (index) => {'id': index, 'isSelected': false});
    var dateNow = Jiffy().format('MMM yyyy');
    var jiffyName = Jiffy()
        .startOf(Units.DAY);
    var jiffyNum = Jiffy()
        .startOf(Units.DAY);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColor.primaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text('Doctor'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                            height:
                            MediaQuery.of(context).size.height / 5,
                            width:
                            MediaQuery.of(context).size.width / 3,
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
                                margin: const EdgeInsets.only(top: 30),
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
              Container(
                margin: const EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  dateNow,
                  style: const TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              FutureBuilder<List<BookingModel>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('لا يمكنك الحجز الان');
                  } else if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          height: 90,
                          child: ListView(
                              scrollDirection: Axis.horizontal,

                              children: List.generate(
                                7,
                                    (index) => Container(
                                  width: 70,
                                  margin:
                                  const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff107163),
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            jiffyName
                                                .add(
                                              days: (1),
                                            )
                                                .E
                                                .substring(0, 3),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Roboto',
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 10),
                                          padding:
                                          const EdgeInsets.all(7),
                                          child: Text(
                                            jiffyNum
                                                .add(days: 1)
                                                .date
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Roboto',
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(left: 20, top: 30),
                          child: const Text(
                            'Time',
                            style: TextStyle(
                              color: Color(0xff363636),
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            right: 15,
                            left: 15,
                          ),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            crossAxisSpacing: 7.0,
                            mainAxisSpacing: 7.0,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            childAspectRatio: 2.7,
                            children: List.generate(
                              widget.booking.length,
                                  (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = !isSelected;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (isSelected == false) ?
                                    AppColor.primaryColor: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: MaterialButton(
                                    onPressed: ()
                                    {
                                      setState(() {
                                        isSelected = !isSelected;
                                      });
                                    },
                                    color: (isSelected == false) ?
                                    AppColor.primaryColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        Text(
                                          widget.booking[index].time
                                              .toString().substring(0,6),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width:
                            MediaQuery.of(context).size.width - 20,
                            child: CustomButtonAuth(
                              text: "تاكيد الحجز",
                              onPressed: () async {
                                await http.post(
                                  Uri.parse(
                                      "https://D3mk.com/manshy.php"),
                                  body: {
                                    'date': dateNow.toString(),

                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
        ),
      ),
    );
  }
}
