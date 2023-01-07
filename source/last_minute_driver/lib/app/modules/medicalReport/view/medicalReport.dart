// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/homePage/controller/homePageStaffController.dart';
import 'package:last_minute_driver/app/modules/medicalReport/controller/medicalReportController.dart';
import 'package:last_minute_driver/helper/shared_preference.dart';
import 'package:last_minute_driver/widgets/big_text.dart';
import 'package:last_minute_driver/widgets/checkbox_dropdown.dart';
import 'package:last_minute_driver/widgets/text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/button.dart';

class MedicalReport extends GetView<MedicalReportController> {
  HomepageStaffController homepageStaffController=Get.find();
  static const route = '/medical-report';
  static launch() => Get.toNamed(route);
  MedicalReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width15, vertical: Dimensions.height20),
          child: Column(children: [
            Center(
                child: BigText(
              text: 'Medical Report',
              size: Dimensions.font26 * 1.3,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SizedBox(
                      height: Dimensions.height40 * 11.6,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: Dimensions.height40 * 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20,
                                  vertical: Dimensions.height20),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFFe8e8e8),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius20)),
                                  color: AppColors.lightPink),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.symptoms,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Symptoms',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.problem,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Problem',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.condition,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Condition',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.diagnosis,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Diagnosis',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller
                                              .physicianRecommendation,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Physician Recommendation',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        width: 2, color: AppColors.pink)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: BigText(
                                    text: 'Chief Complaint',
                                    fontWeight: FontWeight.bold,
                                    size: Dimensions.font26 * 0.9,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    SizedBox(
                      height: Dimensions.height40 * 15.6,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: Dimensions.height40 * 14,
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20,
                                  vertical: Dimensions.height20),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFFe8e8e8),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius20)),
                                  color: AppColors.lightPink),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  GetBuilder<MedicalReportController>(
                                    init: MedicalReportController(),
                                    initState: (_) {},
                                    builder: (_) {
                                      return DropdownButtonHideUnderline(
                                        child: Container(
                                          height: Dimensions.height20 * 2.7,
                                          width: Dimensions.width40 * 7.5,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              border: Border.all(
                                                  width: 2,
                                                  color: AppColors.pink),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      Dimensions.radius20 /
                                                          2))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButton2(
                                              isExpanded: true,
                                              hint: Text(
                                                'Pain Level',
                                                style: TextStyle(
                                                  fontSize: Dimensions.font15,
                                                  color:
                                                      Theme.of(context).hintColor,
                                                ),
                                              ),
                                              items: controller
                                                  .addDividersAfterPainLevelItems(
                                                      controller.painLevelList),
                                              customItemsHeights: controller
                                                  .getCustomPainLevelItemsHeights(),
                                              value: controller
                                                  .selectedPainLevelValue,
                                              onChanged: (value) {
                                                controller.onABChanged(
                                                    value.toString());
                                              },
                                              buttonHeight: 40,
                                              dropdownMaxHeight: 200,
                                              buttonWidth: 140,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Container(
                                    height: Dimensions.height20 * 2.7,
                                    width: Dimensions.width40 * 7.5,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            width: 2, color: AppColors.pink),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Dimensions.radius20 / 2))),
                                    child: TextButton(
                                      onPressed: () {
                                        Get.dialog(
                                            barrierDismissible: false,
                                            Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      border: Border.all(
                                                          width: 2,
                                                          color:
                                                              AppColors.pink),
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(
                                                              Dimensions
                                                                  .radius15))),
                                                  child: Material(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .radius15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: Dimensions
                                                                      .height10 /
                                                                  2,
                                                            ),
                                                            BigText(
                                                              text:
                                                                  'Glasgow Coma Scale',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              size: Dimensions
                                                                      .font20 *
                                                                  1.2,
                                                            ),
                                                            SizedBox(
                                                              height: Dimensions
                                                                      .height10 /
                                                                  2,
                                                            ),
                                                            CheckDropdownButton(
                                                                titleTileText:
                                                                    'Eye Response ',
                                                                dropList: [
                                                                  'No eye opening',
                                                                  'Eye opening to pain',
                                                                  'Eye opening to sound',
                                                                  'Eye opens spontaneousy'
                                                                ]),
                                                            CheckDropdownButton(
                                                                titleTileText:
                                                                    'Verbal Response ',
                                                                dropList: [
                                                                  'No verbal response',
                                                                  'Incomprehensible sounds',
                                                                  'Inappropriate words',
                                                                  'Confused',
                                                                  'Orientated'
                                                                ]),
                                                            CheckDropdownButton(
                                                                titleTileText:
                                                                    'Motor Response ',
                                                                dropList: [
                                                                  'No motor response',
                                                                  'Abnormal extension to pain',
                                                                  'Abnormal flexion to pain',
                                                                  'Withdrawal from pain',
                                                                  'Localizing pain',
                                                                  'Obey commands'
                                                                ]),
                                                            SizedBox(
                                                              height: Dimensions
                                                                  .height30,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Button(
                                                                  on_pressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  text:
                                                                      'Go Back',
                                                                  textColor:
                                                                      AppColors
                                                                          .pink,
                                                                  radius: Dimensions
                                                                          .radius20 *
                                                                      2,
                                                                  width: Dimensions
                                                                          .width40 *
                                                                      3.2,
                                                                  height: Dimensions
                                                                          .height40 *
                                                                      1.1,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  boxBorder: Border.all(
                                                                      width: 2,
                                                                      color: AppColors
                                                                          .pink),
                                                                ),
                                                                Button(
                                                                  on_pressed:
                                                                      () {},
                                                                  text:
                                                                      'Submit',
                                                                  textColor:
                                                                      AppColors
                                                                          .pink,
                                                                  radius: Dimensions
                                                                          .radius20 *
                                                                      2,
                                                                  width: Dimensions
                                                                          .width40 *
                                                                      3.2,
                                                                  height: Dimensions
                                                                          .height40 *
                                                                      1.1,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  boxBorder: Border.all(
                                                                      width: 2,
                                                                      color: AppColors
                                                                          .pink),
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
                                            ));
                                      },
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: BigText(
                                            text: 'Glasgow Coma Scale',
                                            size: Dimensions.font15 * 1.05,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.pulse,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Pulse (beats per minute)',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.respirations,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Respirations (breaths per minute)',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.bloodPressure,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Blood Pressure (mm Hg)',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.temperature,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Temperature (°F)',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Text_Field(
                                        fieldColor: AppColors.white,
                                        radius: Dimensions.radius20 / 2,
                                        text_field_width:
                                            Dimensions.width40 * 7.5,
                                        text_field_height:
                                            Dimensions.height20 * 2.7,
                                        text_field: TextField(
                                          controller: controller.pulseOximetry,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Pulse Oximetry (%)',
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        width: 2, color: AppColors.pink)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: BigText(
                                    text: 'Vital Signs',
                                    fontWeight: FontWeight.bold,
                                    size: Dimensions.font26 * 0.9,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Button(
                      on_pressed: () async{
                        var data=await FirebaseFirestore.instance.collection('bookings').doc(homepageStaffController.patientId).get();
                        if(data['ambulanceStatus']=='assigned'){
                          await FirebaseFirestore.instance.collection('bookings').doc(homepageStaffController.patientId).update({
                            'medicalReport':{
                            'symptoms':controller.symptoms.text,
                            'problem':controller.problem.text,
                            'condition':controller.condition.text,
                            'diagnosis':controller.diagnosis.text,
                            'physician':controller.physicianRecommendation.text,
                            'painLevel':controller.selectedPainLevelValue,
                            'glassGowComa':{
                              'eyeResponse':controller.eyeResponse,
                              'verbalResponse':controller.verbalResponse,
                              'motorResponse':controller.motorResponse
                            },
                            'pulse':controller.pulse.text,
                            'respiration':controller.respirations.text,
                            'bloodPressure':controller.bloodPressure.text,
                            'temperature':controller.temperature.text,
                            'pulseOximetry':controller.pulseOximetry.text

                          }
                          });
                        }
                        Get.back();
                      },
                      text: 'SUBMIT',
                      color: AppColors.pink,
                      textColor: AppColors.white,
                      height: Dimensions.height40 * 1.4,
                      width: Dimensions.width40 * 5,
                      radius: Dimensions.radius30,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
