import 'package:edufuture/ui/course_sub_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widget/common_text_widget.dart';


class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextView("Paper-1",color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.bold,),
            CommonTextView("Cost And Management Accounting",color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w500,),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
            EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
            child: TextFormField(
              style: TextStyle(fontSize: 16.sp,color: Colors.black),
              controller: searchController,
              onEditingComplete: () {
                setState(() {

                  FocusScope.of(context).unfocus();
                });
              },
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 7.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Search hear...",
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      )),
            ),
          ),
         Expanded(
           child: ListView.builder(itemBuilder: (context,index){
             return  GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseSubDetailScreen()));
               },
               child: Container(
                 margin: EdgeInsets.only(bottom: 2.w,left: 2.w,right: 2.w),
                 padding: EdgeInsets.only(left: 2.w,right: 2.w),
                 height: 5.h,width: 100.w,
                 decoration: BoxDecoration(
                   color: Colors.grey,
                   border: Border.all(
                       color: Colors.black,
                       width: 0.2.w
                   ),
                   boxShadow:[
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5), //color of shadow
                       spreadRadius: 1, //spread radius
                       blurRadius: 2, // blur radius
                       offset: Offset(0, 2), // changes position of shadow
                     ),
                   ],
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CommonTextView("Cost And Management Accounting",color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w500,),
                     Container(
                       height: 7.w,
                       width: 7.w,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         color: Colors.black,
                       ),
                       child:  CommonTextView("2",color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w500,),
                     ),
                   ],
                 ),
               ),
             );
           }),
         ),
        ],
      ),
    );
  }
}
