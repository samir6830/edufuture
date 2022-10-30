import 'package:edufuture/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widget/common_text_widget.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({Key? key}) : super(key: key);

  @override
  State<LiveClassScreen> createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Lectures"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context,index){
            return Container(

              width: 100.w,
              margin: EdgeInsets.all(2.w),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70.w,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonRow("Subject", "English"),
                        commonRow("Description", "Lesson 2 :- Harshad Mehta"),
                        commonRow("Date", "12 Aug 2022"),
                        commonRow("Time", "12:30 PM"),
                      ],
                    ),
                  ),
                  Container(
                    height:4.h,
                    width: 20.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Color(0xffCF6679),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        surfaceTintColor: Colors.transparent,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: (){},
                      child: CommonTextView("Join",fontSize: 15.sp,),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

}
