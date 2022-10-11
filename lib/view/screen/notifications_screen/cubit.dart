
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/notification_model.dart';
import 'package:doctor_app/network/dio_helper.dart';
import 'package:doctor_app/network/end_points.dart';
import 'package:doctor_app/view/screen/notifications_screen/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationStates>
{
  NotificationCubit() : super (NotificationInitialState());
  static NotificationCubit get(context) => BlocProvider.of<NotificationCubit>(context);

  List<NotificationModel> notificationModel = <NotificationModel>[];
  var dio = Dio();
  Future<List<NotificationModel>?> getNotifications() async
  {
    emit(NotificationLoadingState());

    final response = await dio.get(
        "https://d3mk.com/apinew.php",
        //queryParameters: {'id': 12, 'name': 'wendu'},
    );
    if(response.statusCode == 200)
    {
      List<dynamic> values=<dynamic>[];
      values = NotificationModel.fromJson(response.data) as List;
      if(values.length>0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            notificationModel .add(NotificationModel.fromJson(map));
            print('Id-------${map['id']}');
            print(response.data);
          }
        }
      }
      emit(NotificationSuccessState());
      return notificationModel;
    }
    //notificationModel = response.data.map((e) => NotificationModel.fromJson(e));
  }
}