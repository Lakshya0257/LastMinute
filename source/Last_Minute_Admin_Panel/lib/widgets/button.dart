// ignore_for_file: non_constant_identifier_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:last_minute_admin_panel/widgets/small_text.dart';



import '../utils/colors.dart';
import '../utils/dimensions.dart';

class Button extends StatelessWidget {
  final VoidCallback on_pressed;
  final String text;
  double? width;
  double? height;
  double? radius;
  Color? color;
  double? textSize;
  Color? textColor;
  BoxBorder? boxBorder;
  EdgeInsetsGeometry? margin;
  Button(
      {Key? key,
        this.textSize=0,
        required this.on_pressed,
        required this.text,
        this.radius=8,
        this.boxBorder,
        this.textColor=AppColors.white,
        this.margin,
        this.width=0,
        this.color=AppColors.deepGreen,
        this.height=0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: on_pressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          // minimumSize: Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // alignment: Alignment.centerLeft
        ),
        child: Container(
          width:width==0 ? Dimensions.screenWidth*0.6 : width,
          height: height ==0 ? Dimensions.screenWidth*0.15 : height,
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius!.toDouble())),
              border: boxBorder,
              color: color
          ),
          child: Center(
            child: SmallText(text: text, size: textSize==0? Dimensions.font20 : textSize!, color: textColor, fontWeight: FontWeight.bold,),
          ),
        ));
  }
}