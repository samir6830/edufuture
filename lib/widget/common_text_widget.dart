

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonTextView extends StatelessWidget{
  String text;
  Color? color;
  double? fontSize;
  TextAlign? textAlign;
  String? fontFamily;
  int? maxLine;
  FontWeight? fontWeight;
  CommonTextView(this.text,{Key? key,this.fontSize,this.fontFamily,this.color,this.textAlign,this.maxLine,this.fontWeight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,maxLines:maxLine ?? 2,overflow: TextOverflow.clip,style: TextStyle(
      fontSize: fontSize ?? 12.sp,
      fontFamily: fontFamily,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.normal
    ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }

}