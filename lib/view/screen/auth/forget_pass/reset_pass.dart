//
// import 'package:doctor_app/core/const/color.dart';
// import 'package:doctor_app/core/const/token.dart';
// import 'package:doctor_app/view/screen/auth/forget_pass/cubit.dart';
// import 'package:doctor_app/view/screen/auth/forget_pass/state.dart';
// import 'package:doctor_app/view/screen/auth/success_sign/success_sign.dart';
// import 'package:doctor_app/view/widget/auth/custom_button.dart';
// import 'package:doctor_app/view/widget/auth/logo.dart';
// import 'package:doctor_app/view/widget/navigate_finish.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
//
// class ResetPassword extends StatefulWidget {
//   const ResetPassword({Key? key}) : super(key: key);
//
//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }
//
// class _ResetPasswordState extends State<ResetPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ForgetPassCubit() ,
//       child: BlocConsumer<ForgetPassCubit, ForgetPassStates>(
//           listener: (context, state) {},
//         builder: (context, state) {
//           var cubit = ForgetPassCubit.get(context);
//             return Scaffold(
//               body: Form(
//                 key: cubit.formStateReset,
//                 child: ListView(
//                   children:
//                   [
//                     Stack(
//                       alignment: AlignmentDirectional.bottomCenter,
//                       clipBehavior: Clip.none,
//                       children: [
//                         Container(
//                           height: MediaQuery.of(context).size.height / 5,
//                           width: double.infinity,
//                           decoration:  BoxDecoration(
//                             color: AppColor.primaryColor1,
//                             borderRadius: const BorderRadius.only(
//                               bottomLeft: Radius.circular(90),
//                               bottomRight: Radius.circular(90),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: MediaQuery.of(context).size.height / 10,
//                           child:  const Logo(),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height/10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: const [
//                               Text(
//                                 'اعادة تعيين كلمة السر',
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height/25,
//                           ),
//                           TextFormField(
//                             controller: cubit.passwordController,
//                             keyboardType: TextInputType.visiblePassword,
//                             decoration:  const InputDecoration(
//                               hintText: '123123123',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                               floatingLabelBehavior: FloatingLabelBehavior.always,
//                               labelStyle: TextStyle(
//                                 color: AppColor.primaryColor,
//                               ),
//                               label: Text(
//                                 "كلمة السر الجديدة",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               focusColor: AppColor.primaryColor,
//                               suffixStyle: TextStyle(
//                                 color: AppColor.primaryColor,
//                                 backgroundColor: AppColor.primaryColor,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                               ),
//                               suffixIcon: Icon(
//                                 Icons.visibility,
//                                 color: AppColor.primaryColor,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             color: Colors.grey,
//                             height: 1,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height/30,
//                           ),
//                           TextFormField(
//                             controller: cubit.newPasswordController,
//                             keyboardType: TextInputType.visiblePassword,
//                             decoration:  const InputDecoration(
//                               hintText: '123123123',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                               floatingLabelBehavior: FloatingLabelBehavior.always,
//                               labelStyle: TextStyle(
//                                 color: AppColor.primaryColor,
//                               ),
//                               label: Text(
//                                 'اعد كتابة كلمة السر الجديدة',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               focusColor: AppColor.primaryColor,
//                               suffixStyle: TextStyle(
//                                 color: AppColor.primaryColor,
//                                 backgroundColor: AppColor.primaryColor,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                               ),
//                               suffixIcon: Icon(
//                                 Icons.visibility,
//                                 color: AppColor.primaryColor,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             color: Colors.grey,
//                             height: 1,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height/30,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             child: CustomButtonAuth(
//                               text: "27",
//                               onPressed: () async
//                               {
//                                 if(cubit.passwordController.text == cubit.newPasswordController.text){
//                                   await http.post(
//                                     Uri.parse("https://D3mk.com/manshy.php"),
//                                     body: {
//                                       'new_password': cubit.passwordController.text,
//                                     },
//                                   );
//                                   setState(() {
//                                     passwordController = cubit.passwordController;
//                                   });
//                                   navigateAndFinish(context, const SuccessSign());
//                                 } else{
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content: Text(
//                                               "كلمة السر غير متطابقة")));
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//         },
//       ),
//     );
//   }
// }
