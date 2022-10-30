import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget{
  String hintText;
  TextEditingController controller;
  TextInputType? keyboardType;
  CommonTextField({Key? key, required this.hintText,required this.controller,this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      child: TextField(
        cursorColor: Colors.blue,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        style:  TextStyle(color: Colors.blue[900],fontSize: 15.sp),

        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
          fillColor: Colors.white,
          filled: true,
          //   contentPadding: EdgeInsets.only(left: 4.w, right: 4.w),
          hintText: hintText,
          hintStyle:  TextStyle(color: Colors.black26,fontSize: 13.sp,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1,color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1,color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1,color: Colors.black),
          ),
        ),
      ),
    );
  }

}