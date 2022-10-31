import 'package:edufuture/networking/bloc/user_course_bloc.dart';
import 'package:edufuture/ui/view_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import '../main.dart';
import '../networking/model/request model/user_class_request_model.dart';
import '../networking/model/response model/user_course_response_model.dart';
import '../networking/response.dart';
import '../widget/common_text_widget.dart';


class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late UserCourseBloc userCourseBloc;
  List<CourseData> courseList = [];
  @override
  void initState() {

    userCourseBloc = UserCourseBloc();
    userCourseBloc.userCourse(UserClassRequestModel(
      uaserId: int.parse(storage.read("userId").toString()),
    ));
    userCourseBloc.dataStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          stopLoader(context);
          setState(() {
            courseList.addAll(event.data.success);
          });
          break;
        case Status.ERROR:
          stopLoader(context);
          print(Status.ERROR);
          break;
      }
    });
    super.initState();
  }
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
          itemCount: courseList.length,
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
                          commonTitleAndDescription("Name","${courseList[index].name}"),
                          commonTitleAndDescription("Description","${courseList[index].description}"),
                          commonTitleAndDescription("Teacher","${courseList[index].teacherName}"),
                          commonTitleAndDescription("Amount Paid","2000"),
                          commonTitleAndDescription("Join Date","${courseList[index].publishDate}"),
                          commonTitleAndDescription("Expiry Date","${courseList[index].expiryDate}"),
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
