import 'dart:collection';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/Home_screen/iteam_carousal.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late final List<ItemCarousal> list;

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context).schaduleData;
        print('cubit ==> $cubit[dayname]');
        return Scaffold(
          backgroundColor: Color(0xff0066D9),
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: hight / 2.1,
                    width: width,
                    padding: EdgeInsets.only(
                      top: hight / 6,
                      left: width / 50,
                      right: width / 1.8,
                      bottom: hight / 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DR : Maher',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: hight / 70,
                        ),
                        const Text(
                          'Mahmoud',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: hight / 50,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              ' 4.8 Rating',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: hight / 2.1,
                  width: width / 1.8,
                  margin: EdgeInsets.only(
                    top: hight / 50,
                    right: width / 50,
                    left: width / 2.6,
                    bottom: hight / 15,
                  ),
                  child: Image.asset(
                    AppImageAsset.finaldoc,
                    fit: BoxFit.contain,
                    //scale: .2,
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  builder: (BuildContext context, ScrollController controller) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: ListView(
                          controller: controller,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "  افضل دكتور جلديه في مصر",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "استشاري الامراض الجلدية والتجميل والليزر",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "استشاري التناسلية و أمراض الذكورة",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "علاج البهاق بالليزر",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "استشاري جراحات البهاقة",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "علاج الصدفية بالليزر",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "استشاري جلدية الأطفال",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                const Text(
                                  "Gallary",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 80,
                                ),
                                carousal(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                const Text(
                                  "CALL US",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Text(
                                        '01155555555',
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 17,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onTap: () async {
                                        const url = "tel:+2001155555555";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                const Text('Doctor Schedule',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.black54,
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 80,
                                ),
                                // DataTable(
                                //         border: TableBorder.all(
                                //             color: Colors.blueGrey,
                                //             borderRadius:
                                //                 BorderRadius.circular(14)),
                                //         columnSpacing: 16.5,
                                //
                                //         // ignore: prefer_const_literals_to_create_immutables
                                //         columns: List.generate(
                                //           8,
                                //           (indexColumn) => DataColumn(
                                //               label: indexColumn == 0
                                //                   ? const Text('Day')
                                //                   : Text(
                                //                       '${cubit[indexColumn - 1]['dayname']}'
                                //                           .substring(0, 3))),
                                //         ),
                                //
                                //         // ignore: prefer_const_literals_to_create_immutables
                                //
                                //         rows: List.generate(
                                //           2,
                                //           (indexRow) => indexRow == 0
                                //               ? DataRow(
                                //                   cells: List.generate(
                                //                   8,
                                //                   (index2) => DataCell(
                                //                     index2 == 0
                                //                         ? const Text('Start')
                                //                         : cubit[index2 - 1][
                                //                                     'available'] ==
                                //                                 'true'
                                //                             ? Text(
                                //                                 '${cubit[index2 - 1]['time-start']}'
                                //                                     .substring(
                                //                                         0, 2))
                                //                             : const Center(
                                //                                 child:
                                //                                     Text('--')),
                                //                   ),
                                //                 ))
                                //               : DataRow(
                                //                   cells: List.generate(
                                //                   8,
                                //                   (index2) => DataCell(
                                //                     index2 == 0
                                //                         ? const Text('End')
                                //                         : cubit[index2 - 1][
                                //                                     'available'] ==
                                //                                 'true'
                                //                             ? Text(
                                //                                 '${cubit[index2 - 1]['time-end']}'
                                //                                     .substring(
                                //                                         0, 2))
                                //                             : const Center(
                                //                                 child:
                                //                                     Text('--')),
                                //                   ),
                                //                 )),
                                //         ),
                                //       ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
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
      },
    );
  }

  int index = carousalList.length;

  Widget carousal({index}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: carousalList.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = carousalList[index];
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                '${urlImage}',
                width: 240.0,
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 3.5,
            initialPage: 0,
            viewportFraction: 1.0,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
