import 'package:edufuture/ui/view_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widget/common_text_widget.dart';


class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
          automaticallyImplyLeading: false,
        title: const Text("Course"),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: 2.w,right: 2.w,top: 4.w),
              padding: EdgeInsets.all(2.w),
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
                  Container(
                      width: 75.w,
                      child: Column(
                        children: [
                          commonTitleAndDescription("Name","Dhaval Thakkar"),
                          commonTitleAndDescription("Description","English,Unit-1"),
                          commonTitleAndDescription("Teacher","Dhaval Thakkar"),
                          commonTitleAndDescription("Amount Paid","2200"),
                          commonTitleAndDescription("Join Date","10-08-2022"),
                          commonTitleAndDescription("Expiry Date","10-08-2022"),
                        ],
                      )),
                  SizedBox(
                    height: 7.5.w,
                    width: 16.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewCoursesScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        surfaceTintColor: Colors.transparent,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "View",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
  Widget commonTitleAndDescription(String title,String text){
    return Padding(
      padding:  EdgeInsets.only(top: 1.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonTextView("$title : ",color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold,),
          Expanded(child: CommonTextView(text,color: Colors.white,fontSize: 12.sp,)),
        ],
      ),
    );
  }
}
