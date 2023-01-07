import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/utils/colors.dart';
import 'package:last_minute_driver/utils/dimensions.dart';

class MedicalReportController extends GetxController {
  TextEditingController symptoms = TextEditingController();
  TextEditingController problem = TextEditingController();
  TextEditingController condition = TextEditingController();
  TextEditingController diagnosis = TextEditingController();
  TextEditingController physicianRecommendation = TextEditingController();

  TextEditingController pulse = TextEditingController();
  TextEditingController respirations = TextEditingController();
  TextEditingController bloodPressure = TextEditingController();
  TextEditingController temperature = TextEditingController();
  TextEditingController pulseOximetry = TextEditingController();


  final List<String> painLevelList = [
    'No Pain',
    'Mild Pain',
    'Moderate Pain',
    'Severe Pain',
  ];
  String? selectedPainLevelValue;

  List eyeResponse=[];
  List verbalResponse=[];
  List motorResponse=[];

  List<DropdownMenuItem<String>> addDividersAfterPainLevelItems(List<String> painLevelList) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in painLevelList) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != painLevelList.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                thickness: 1,
                color: AppColors.lightGrey,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  onABChanged(String value) {
    selectedPainLevelValue = value;
    update();
  }

  List<double> getCustomPainLevelItemsHeights() {
    List<double> itemsHeights = [];
    for (var i = 0; i < (painLevelList.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(Dimensions.height40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(Dimensions.font15/3);
      }
    }
    return itemsHeights;
  }
}
