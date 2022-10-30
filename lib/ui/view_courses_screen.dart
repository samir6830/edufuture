import 'package:edufuture/ui/course_details_screen.dart';
import 'package:edufuture/widget/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewCoursesScreen extends StatefulWidget {
  const ViewCoursesScreen({Key? key}) : super(key: key);

  @override
  State<ViewCoursesScreen> createState() => _ViewCoursesScreenState();
}

class _ViewCoursesScreenState extends State<ViewCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("View Courses"),
      ),
      body: ListView.builder(
        itemCount: 50,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseDetailsScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 2.w,left: 2.w,right: 2.w),
                padding: EdgeInsets.only(left: 2.w,right: 2.w),
                height: 10.h,
                width: 100.w,
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
                  children: [
                    CircleAvatar(
                      radius: 7.w,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.camera_outdoor_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextView("Paper-1",color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.bold,),
                        CommonTextView("Cost And Management Accounting",color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w500,),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
