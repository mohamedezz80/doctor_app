import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/screen/auth/virfycode_signup/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VirFyCubit extends Cubit<VirFyStates>
{
  VirFyCubit() : super (VirFyInitialState());
  static VirFyCubit get(context) => BlocProvider.of(context);

  late String verifyCode;

}