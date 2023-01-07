// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:last_minute_driver/app/modules/medicalReport/controller/medicalReportController.dart';
import 'package:last_minute_driver/utils/dimensions.dart';
import 'package:last_minute_driver/widgets/big_text.dart';

import '../utils/colors.dart';

class CheckDropdownButton extends StatelessWidget {
  MedicalReportController controller = Get.find();
  final List<String> dropList;
  final String titleTileText;
  CheckDropdownButton(
      {super.key, required this.dropList, required this.titleTileText});

  @override
  Widget build(BuildContext context) {
    return GFMultiSelect(
      items: dropList,
      onSelect: (value) {
        if (dropList ==
            [
              'No eye opening',
              'Eye opening to pain',
              'Eye opening to sound',
              'Eye opens spontaneousy'
            ]) {
          controller.eyeResponse = value;
        } else if (dropList ==
            [
              'No verbal response',
              'Incomprehensible sounds',
              'Inappropriate words',
              'Confused',
              'Orientated'
            ]) {
          controller.verbalResponse = value;
        } else {
          controller.motorResponse = value;
        }
      },
      dropdownTitleTileText: titleTileText,
      size: GFSize.SMALL,

      dropdownTitleTileColor: AppColors.lightPink,
      dropdownTitleTileMargin: EdgeInsets.only(
          top: Dimensions.height20,
          left: Dimensions.width15,
          right: Dimensions.width15,
          bottom: Dimensions.height10 / 2),
      dropdownTitleTilePadding: EdgeInsets.all(Dimensions.height10),
      dropdownUnderlineBorder:
          const BorderSide(color: Colors.transparent, width: 2),
      // dropdownTitleTileBorder:
      //     Border.all(color: AppColors.pink, width: 1),
      dropdownTitleTileBorderRadius:
          BorderRadius.circular(Dimensions.radius20 / 2),
      expandedIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
      collapsedIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: Colors.black54,
      ),
      cancelButton: BigText(
        text: 'CANCEL',
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        size: Dimensions.font15 * 1.1,
      ),
      submitButton: BigText(
        text: 'SUBMIT',
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        size: Dimensions.font15 * 1.1,
      ),
      buttonColor: AppColors.pink,
      dropdownTitleTileTextStyle:
          TextStyle(fontSize: Dimensions.font15 * 1.1, color: Colors.black),
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      type: GFCheckboxType.basic,
      activeBgColor: AppColors.orange.withOpacity(0.5),
      inactiveBorderColor: Colors.grey.shade200,
    );
  }
}
