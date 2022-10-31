

import 'package:edufuture/widget/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///api url
const String baseUrl = "https://portal.edufuture.in/api/";
const String loginApiUrl = "login";
const String userClassApiUrl = "user-class";
const String userLectureApiUrl = "user-lecture";
const String userLectureHistoryApiUrl ="user-lecture-history";
const String userCourseApiUrl = "user-course";

///loader
bool isLoading = true;

void onLoading(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.white.withOpacity(0.5),
    barrierDismissible: false,
    barrierLabel: "Dialog",
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ));
    },
  ).then((value) {
    isLoading = false;
  });
}

void stopLoader(BuildContext context) {
  Navigator.pop(context);
}


Widget commonRow(String title,String text){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CommonTextView("$title : ",color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold,),
      Expanded(child: CommonTextView(text,color: Colors.white,fontSize: 12.sp,)),
    ],
  );
}