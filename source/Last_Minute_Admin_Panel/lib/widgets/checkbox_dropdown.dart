import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class CheckDropdownButton extends StatelessWidget {
  final List<String> dropList;
  final String titleTileText;
  const CheckDropdownButton({super.key, required this.dropList, required this.titleTileText});

  @override
  Widget build(BuildContext context) {
    return GFMultiSelect(
      items: dropList,
      onSelect: (value) {
        // print('selected $value ');
      },
      dropdownTitleTileText: titleTileText ,
      size: GFSize.SMALL,

      dropdownTitleTileColor: Colors.pinkAccent,
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
      buttonColor: Colors.pink,
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
