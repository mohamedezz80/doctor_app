import 'package:doctor_app/core/const/color.dart';
import 'package:doctor_app/view/screen/layout/cubit.dart';
import 'package:doctor_app/view/screen/layout/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorLayOut extends StatelessWidget {
  const DoctorLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit() ,
      child: BlocConsumer<LayoutCubit,LayOutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.backGround,
              elevation: 0.0,

              scrolledUnderElevation: 0.0,
              title: Text(
                "Doctor",
                style: TextStyle(
                  color: AppColor.black,
                ),
              ),
            ),
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              unselectedItemColor: AppColor.grey,
              selectedItemColor: AppColor.primaryColor,
              items:
              const [
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.access_alarm),
                  label: 'الحجز',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.notifications),
                  label: 'الاشعارات',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.settings),
                  label: 'الاعدادات',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
