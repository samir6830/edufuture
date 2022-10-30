import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import '../main.dart';
import '../networking/bloc/user_class_bloc.dart';
import '../networking/model/request model/user_class_request_model.dart';
import '../networking/model/response model/user_class_response_model.dart';
import '../networking/response.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  late UserClassBloc userClassBloc;
  List<ClassData> classList = [];
  @override
  void initState() {
    userClassBloc = UserClassBloc();
    userClassBloc.userClass(UserClassRequestModel(
      uaserId: int.parse(storage.read("userId").toString()),
    ));
    userClassBloc.dataStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          stopLoader(context);
          setState(() {
            classList.addAll(event.data.success);
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
        title: const Text("Class"),),
      body: ListView.builder(
          itemCount: classList.length,
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
                        commonRow("Class Name", "${classList[index].className}"),
                        commonRow("Grade Name", "${classList[index].gradeName}"),
                        commonRow("Teacher Name", "${classList[index].teacherName}"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
