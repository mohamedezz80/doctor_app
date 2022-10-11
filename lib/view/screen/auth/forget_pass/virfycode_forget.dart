//
// import 'package:doctor_app/core/const/color.dart';
// import 'package:doctor_app/view/screen/auth/forget_pass/reset_pass.dart';
// import 'package:doctor_app/view/screen/auth/virfycode_signup/cubit.dart';
// import 'package:doctor_app/view/screen/auth/virfycode_signup/state.dart';
// import 'package:doctor_app/view/widget/auth/logo.dart';
// import 'package:doctor_app/view/widget/navigate_finish.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:http/http.dart' as http;
//
// class VirFyCodeForget extends StatelessWidget {
//   const VirFyCodeForget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => VirFyCubit() ,
//       child: BlocConsumer<VirFyCubit, VirFyStates>(
//         listener: (context, state){},
//         builder: (context, state){
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColor.backGround,
//               elevation: 0.0,
//               centerTitle: true,
//               title: Text(
//                 "كود التاكيد",
//                 style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.grey[700],
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: IconButton(
//                 onPressed: (){
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back_ios),
//                 color: Colors.grey,
//                 iconSize: 20,
//               ),
//             ),
//             body: ListView(
//               children:
//               [
//                 Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   clipBehavior: Clip.none,
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height / 5,
//                       width: double.infinity,
//                       decoration:  BoxDecoration(
//                         color: AppColor.primaryColor1,
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(90),
//                           bottomRight: Radius.circular(90),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: MediaQuery.of(context).size.height / 10,
//                       child:  const Logo(),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height/10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text(
//                             'ادخل كود التاكيد',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height/30,
//                       ),
//                       OtpTextField(
//                         numberOfFields: 5,
//                         fieldWidth: 50,
//                         borderColor: AppColor.primaryColor,
//                         showFieldAsBox: true,
//                         borderRadius: BorderRadius.circular(20),
//                         onCodeChanged: (String code) {},
//                         onSubmit: (String verificationCode) async
//                         {
//                           print(verificationCode.toString());
//                           http.Response response = await http.post(
//                             Uri.parse("https://D3mk.com/manshy.php"),
//                             body: {
//                               'code': verificationCode.toString(),
//                             },
//                           );
//                           if (response.body == "ok test") {
//                             print("Correct");
//                             navigateAndFinish(context, const ResetPassword());
//                           } else
//                           {
//                             print("not Correct");
//                             ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text(
//                                         "The code number is not correct")));
//                           }
//
//                         }, // end onSubmit
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
