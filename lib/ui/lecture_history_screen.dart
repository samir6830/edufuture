import 'package:edufuture/networking/model/response%20model/user_lecture_history_response_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import '../main.dart';
import '../networking/bloc/user_lecture_history_bloc.dart';
import '../networking/model/request model/user_class_request_model.dart';
import '../networking/response.dart';
import '../widget/common_text_widget.dart';

class LectureHistory extends StatefulWidget {
  const LectureHistory({Key? key}) : super(key: key);

  @override
  State<LectureHistory> createState() => _LectureHistoryState();
}

class _LectureHistoryState extends State<LectureHistory> {
  late UserLectureHistoryBloc userLectureHistoryBloc;
  List<LectureHistoryData> lectureHistoryList = [];
  @override
  void initState() {
    userLectureHistoryBloc = UserLectureHistoryBloc();
    userLectureHistoryBloc.userLectureHistory(UserClassRequestModel(
      uaserId: int.parse(storage.read("userId").toString()),
    ));
    userLectureHistoryBloc.dataStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          stopLoader(context);
          setState(() {
            lectureHistoryList.addAll(event.data.success);
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
        title: const Text("Lecture History"),
      ),
      body: ListView.builder(
          itemCount: lectureHistoryList.length,
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
                        commonRow("Name", "${lectureHistoryList[index].name}"),
                        commonRow("Description", "${lectureHistoryList[index].description}"),
                        commonRow("Date", "${lectureHistoryList[index].startDate} - ${lectureHistoryList[index].endDate}"),
                        commonRow("Time", "${lectureHistoryList[index].startTime} - ${lectureHistoryList[index].endTime}"),
                        commonRow("Duration", "${lectureHistoryList[index].duration}"),
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
