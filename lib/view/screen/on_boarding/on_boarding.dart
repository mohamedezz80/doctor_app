
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/login_screen.dart';
import 'package:doctor_app/view/screen/on_boarding/contant.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();
  int currentPage = 0;
  late OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            backgroundColor: AppColor.primaryColor,
            body: Stack(
              alignment: AlignmentDirectional.topStart,
              //clipBehavior: Clip.none,
              children: [
                Container(
                  height: hight/2.8,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(500),
                      bottomRight: Radius.circular(500),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImageAsset.doctor,
                      ),
                    ),
                  ),
                ),
                PageView.builder(
                  itemCount: onBoardingList.length,
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index)
                  {
                    setState(() {
                      if (index == onBoardingList.length - 1) {
                        cubit.isLast = true;
                        print('Last');
                      } else {
                        cubit.isLast = false;
                        print('Not Last');
                      }
                    });
                  },
                  itemBuilder: (context, index){
                    return Container(

                      padding: EdgeInsets.only(
                        top: hight/ 2.2,
                        right: width/ 40,
                        left: width/ 40,
                      ),
                      child: Card(
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Container(
                          height: hight/2,
                          width: width/1,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: hight/ 40,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FloatingActionButton(
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                          ),
                                          onPressed: () {
                                            if (cubit.isLast) {
                                              navigateTo(context, Login());
                                            } else {
                                              boardController.nextPage(
                                                duration: const Duration(
                                                  milliseconds: 750,
                                                ),
                                                curve: Curves.fastLinearToSlowEaseIn,
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: hight/ 25,
                                    ),
                                    Container(
                                      height: hight/ 25,
                                      child: Text(
                                        onBoardingList[index].title!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hight/ 30,
                                    ),
                                    Container(
                                      height: hight/4.5,
                                      child: Text(
                                        onBoardingList[index].body!,
                                        maxLines: 7,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hight/ 30,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        SmoothPageIndicator(
                                          controller: boardController,
                                          count: onBoardingList.length,
                                          effect:  ExpandingDotsEffect(
                                            dotColor: Colors.grey,
                                            activeDotColor: AppColor.primaryColor,
                                            dotHeight: 10,
                                            dotWidth: 10,
                                            spacing: 5,
                                            expansionFactor: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
