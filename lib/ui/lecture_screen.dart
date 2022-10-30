import 'package:edufuture/networking/bloc/user_lecture_bloc.dart';
import 'package:edufuture/networking/model/response%20model/user_lecture_response_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';
import '../main.dart';
import '../networking/model/request model/user_class_request_model.dart';
import '../networking/response.dart';
import '../widget/common_text_widget.dart';


class LectureScreen extends StatefulWidget {
  const LectureScreen({Key? key}) : super(key: key);

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  late UserLectureBloc userLectureBloc;
  List<Lecture> lectureList = [];
  @override
  void initState() {

    userLectureBloc = UserLectureBloc();
    userLectureBloc.userLecture(UserClassRequestModel(
      uaserId: int.parse(storage.read("userId").toString()),
    ));
    userLectureBloc.dataStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          stopLoader(context);
          setState(() {
            lectureList.addAll(event.data.success);
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
        title: const Text("Lectures"),
      ),
      body: ListView.builder(
          itemCount: lectureList.length,
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
                        commonRow("Name", "${lectureList[index].name}"),
                        commonRow("Class", "${lectureList[index].className}"),
                        commonRow("Teacher", "${lectureList[index].teacher}"),
                        commonRow("Description", "${lectureList[index].description}"),
                        commonRow("Start Date", "${lectureList[index].startDate}"),
                        commonRow("End Date", "${lectureList[index].endDate}"),
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
