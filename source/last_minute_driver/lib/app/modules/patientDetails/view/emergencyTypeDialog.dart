// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// import '../../../../utils/colors.dart';
// import '../../../../utils/dimensions.dart';
// import '../../../../widgets/big_text.dart';
// import '../../../../widgets/button.dart';
// import '../../../../widgets/text_field.dart';
// import '../controller/patientController.dart';


// class EmergencyTypeDialog extends GetView<PatientDetailsController> {
//   const EmergencyTypeDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: Dimensions.width40 * 8,
//         height: Dimensions.height40 * 9,
//         color: AppColors.white,
//         child: GetBuilder<PatientDetailsController>(
//           builder: (_) => SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Checkbox(
//                         value: controller.breathing,
//                         activeColor: Colors.blue,
//                         fillColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.disabled)) {
//                             return Colors.blue;
//                           }
//                           return AppColors.pink;
//                         }),
//                         onChanged: (newBool) {
//                           controller.onBreatingChange(newBool!);
//                         }),
//                     BigText(text: 'Breathing Problem')
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Checkbox(
//                         value: controller.asthmaAttack,
//                         activeColor: Colors.blue,
//                         fillColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.disabled)) {
//                             return Colors.blue;
//                           }
//                           return AppColors.pink;
//                         }),
//                         onChanged: (newBool) {
//                           controller.onAsthmaAttackChanged(newBool!);
//                         }),
//                     BigText(text: 'Asthma Attack')
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Checkbox(
//                         value: controller.bleeding,
//                         activeColor: Colors.blue,
//                         fillColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.disabled)) {
//                             return Colors.blue;
//                           }
//                           return AppColors.pink;
//                         }),
//                         onChanged: (newBool) {
//                           controller.onBleedingChanged(newBool!);
//                         }),
//                     BigText(text: 'Bleeding')
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Checkbox(
//                         value: controller.heartAttack,
//                         activeColor: Colors.blue,
//                         fillColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.disabled)) {
//                             return Colors.blue;
//                           }
//                           return AppColors.pink;
//                         }),
//                         onChanged: (newBool) {
//                           controller.onHeartAttackChanged(newBool!);
//                         }),
//                     BigText(text: 'Heart Attack')
//                   ],
//                 ),
//                 SizedBox(height: Dimensions.height15,),
//                 Text_Field(
//                                   radius: Dimensions.radius20 ,
//                                   text_field_width: double.maxFinite,
//                                   text_field_height: Dimensions.height20 * 2.5,
//                                   text_field: TextField(
                                    
//                                     keyboardType: TextInputType.text,
//                                     decoration: const InputDecoration(
//                                       border: InputBorder.none,
//                                       prefixIcon: Icon(
//                                         Icons.search,
//                                         color: AppColors.pink,
//                                       ),
//                                       hintText: 'Other',
//                                     ),
//                                   )),
//                                   SizedBox(height: Dimensions.height15,),
//                                   Button(
//                               width: Dimensions.width40*4,
//                               height: Dimensions.height40 * 1.5,
//                               radius: Dimensions.radius20 * 2,
//                               on_pressed: () {
                                
//                                 Get.back();
//                               },
//                               text: 'Confirm',
//                               color: AppColors.pink,
                              
//                             )
//               ],
//             ),
//           ),
//         ));
//   }
// }
