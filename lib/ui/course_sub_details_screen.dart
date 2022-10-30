import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widget/common_text_widget.dart';


class CourseSubDetailScreen extends StatefulWidget {
  const CourseSubDetailScreen({Key? key}) : super(key: key);

  @override
  State<CourseSubDetailScreen> createState() => _CourseSubDetailScreenState();
}

class _CourseSubDetailScreenState extends State<CourseSubDetailScreen> {
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
          Expanded(child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(top: 2.w,left: 2.w,right: 2.w),
                  padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 2.w,bottom: 2.w),

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
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 7.w,
                        backgroundColor: Colors.black,
                        child: const Icon(
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
                          CommonTextView("Accounting for Bonus issue and right issue",color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold,),
                          Row(

                            children: [
                              const Icon(Icons.person_sharp),
                              SizedBox(width: 1.w,),
                              CommonTextView("Speaker: CA. Sanket Shah"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.date_range),
                              SizedBox(width: 1.w,),
                              CommonTextView("Date: 15 March,2022, Tuesday"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.alarm),
                              SizedBox(width: 1.w,),
                              CommonTextView("Session: Afternoon"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              )
          ),
        ],
      ),
    );
  }
}
