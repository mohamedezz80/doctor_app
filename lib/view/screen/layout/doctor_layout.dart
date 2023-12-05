import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/core/const/http.dart';
import 'package:doctor_app/view/screen/auth/login/cubit.dart';
import 'package:doctor_app/view/screen/auth/login/state.dart';
import 'package:doctor_app/view/screen/layout/cubit.dart';
import 'package:doctor_app/view/screen/layout/state.dart';
import 'package:doctor_app/view/widget/auth/is_logined.dart';
import 'package:doctor_app/view/widget/auth/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorLayOut extends StatefulWidget {
  const DoctorLayOut({Key? key}) : super(key: key);

  @override
  State<DoctorLayOut> createState() => _DoctorLayOutState();
}

class _DoctorLayOutState extends State<DoctorLayOut> {

  Future<void> checkConnectivity() async
  {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
  }
  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit() ,
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          var size = MediaQuery.of(context).size;
          cubit.sharedPrefName();
          // LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              elevation: 0,
              title:  Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 95, 153, 182),
                ),
                child: Text(
                    'welcome : ${cubit.sharedName.toString()}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              onTap: (index)
              {
                cubit.changeBottom(index);
              },
              //currentIndex: cubit.currentIndex,
              //unselectedItemColor: AppColor.grey,
             // selectedItemColor: Appconst Color.primaryColor,
              backgroundColor: Colors.white,
              color: AppColor.primaryColor,
              index: cubit.currentIndex,
              height: 60,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.easeInOut,

              items:
                const [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                 Icon(
                   Icons.calendar_today,
                   color: Colors.white,
                 ),
                 Icon(
                   Icons.home,
                   color: Colors.white,
                 ),
                 Icon(
                   Icons.notifications,
                   color: Colors.white,
                 ),
                 Icon(
                   Icons.settings,
                   color: Colors.white,
                 ),
              ],
            ),
          );
        },
      ),
    );
  }
}
