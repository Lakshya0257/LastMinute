// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class DropDown extends StatelessWidget {
  DropDown(
      {required this.name,
      required this.value,
      required this.items,
      required this.onChanged,
      this.width,
      this.height,
      super.key});
  String name;
  Object value;
  double? width;
  double? height=50;
  List<DropdownMenuItem<Object>> items;
  void Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width!=null? width:double.maxFinite,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          border: Border.all(color: AppColors.pink,width: 2)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged: onChanged),
      ),
    );
  }
}
