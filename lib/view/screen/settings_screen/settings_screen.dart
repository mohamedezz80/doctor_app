import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/http.dart';
import 'package:doctor_app/core/const/image_asset.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/auth/success_sign/success_sign.dart';
import 'package:doctor_app/view/screen/booking_screens/Success_booking.dart';
import 'package:doctor_app/view/screen/settings_screen/change_password.dart';
import 'package:doctor_app/view/widget/auth/is_logined.dart';
import 'package:doctor_app/view/widget/navigate_to.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  //var result ;
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

  //late bool val;





  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = LoginCubit.get(context);
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return Scaffold(
                backgroundColor: Color(0xff0066D9),
                body: SafeArea(
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    //clipBehavior: Clip.none,
                    children: [
                      // Container(
                      //   height: hight/3.5,
                      //   width: double.infinity,
                      //   margin: const EdgeInsets.only(
                      //     top: 35,
                      //     left: 10,
                      //     //bottom: hight / 15,
                      //   ),
                      //   child: const Text(
                      //     'Welcome : Mohamed Ahmed',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.bold
                      //     ),
                      //   ),
                      // ),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // SizedBox(
                                      //   height: hight/25,
                                      // ),
                                      // IconButton(
                                      //   icon: Icon(
                                      //     cubit.isDark ?
                                      //         cubit.iconDark: cubit.iconLight,
                                      //   ),
                                      //   onPressed: ()
                                      //   {
                                      //
                                      //     cubit.changeThemeMode();
                                      //   },
                                      // ),
                                      // SwitchListTile(
                                      //     value: cubit.isDark,
                                      //     onChanged: (value)
                                      //   {
                                      //     cubit.changeThemeMode();
                                      //   },
                                      //   title: const Text(
                                      //     "Dark Mode",
                                      //     style: TextStyle(
                                      //       fontSize: 16,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: hight/25,
                                      ),
                                      const Text(
                                        'Settings',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: hight/25,
                                      ),
                                      InkWell(
                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Change Password",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: (){},
                                                  icon:  Icon(
                                                    Icons.password,
                                                    color: AppColor.primaryColor,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          navigateTo(context, const ChangePassword());
                                        },
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height/40,
                                      ),
                                      InkWell(
                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children:  [
                                                const Text(
                                                  "Wifi",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                    vertical: 3,
                                                  ),
                                                  child: CupertinoSwitch(
                                                    trackColor: Colors.grey,
                                                      activeColor: AppColor.primaryColor,

                                                      value: cubit.val,
                                                      onChanged: (newValue){
                                                        onChangeMethod(newValue);
                                                      },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          navigateTo(context, const ChangePassword());
                                        },
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height/40,
                                      ),
                                      InkWell(
                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Log Out",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: (){},
                                                  icon: Icon(
                                                    Icons.logout,
                                                    color: AppColor.primaryColor,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          signOut(context);
                                        },
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height/40,
                                      ),
                                      InkWell(
                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Website",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: (){},
                                                  icon: Icon(
                                                    Icons.web,
                                                    color: AppColor.primaryColor,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: ()
                                        {
                                          launchUrl('http://websites.milonic.com/d3mk.com/');
                                        },
                                      ),
                                      SizedBox(
                                        height: hight/40,
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
  onChangeMethod(bool newValue) async
  {
    var cubit = LoginCubit.get(context);
    var result = await Connectivity().checkConnectivity();
    cubit.val = true;
    String RESULT = result.name;
    if(RESULT == 'wifi'){
      setState(() {
        cubit.val = newValue;
        cubit.val = true;
      });
    } else {
      cubit.val = false;
      cubit.val = newValue;
    }
  }
}
