// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class BigText extends StatelessWidget {

  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  int? maxLines;
  String fontFamily;
  double? letterspacing;

  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.letterspacing,
    this.fontFamily='',
    this.fontWeight = FontWeight.normal,
    this.size = 0,
    this.maxLines=1,
    this.overflow = TextOverflow.ellipsis}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      softWrap: true,
      maxLines: maxLines,
      overflow: maxLines==null? null: overflow,
      style: TextStyle(
        fontFamily: fontFamily==''?  'RedHat':fontFamily,
        color: color,
        fontSize: size ==0 ? Dimensions.font20 : size,
        fontWeight: fontWeight == FontWeight.normal ? FontWeight.w400 : fontWeight,letterSpacing: letterspacing
      ),
    );
  }
}
