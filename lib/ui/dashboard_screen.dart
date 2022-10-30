import 'package:edufuture/main.dart';
import 'package:edufuture/ui/class_screen.dart';
import 'package:edufuture/ui/lecture_history_screen.dart';
import 'package:edufuture/ui/lecture_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  /// on selection change calender date selction
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Text(
                "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "${storage.read("email").toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPictureSize: Size(30.w, 30.w),
              currentAccountPicture:Image.asset("assets/ic_edufuture.png",fit: BoxFit.cover,),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Class'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ClassScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.class_,
              ),
              title: const Text('Lecture'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LectureScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.leaderboard,
              ),
              title: const Text('Lecture History'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LectureHistory()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Container(
            margin: EdgeInsets.only(top: 4.w,bottom: 4.w),
            width: 16.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                surfaceTintColor: Colors.transparent,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Store",
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text("DashBoard"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /*  Container(
                padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0.8),
                        blurRadius: 1,
                        color: Colors.black45,
                      )
                    ]),
                height: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DashBoard",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 7.5.w,
                      width: 16.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          surfaceTintColor: Colors.transparent,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Store",
                          style: TextStyle(fontSize: 12.sp, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              SizedBox(
                height: 4.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonTotalCountWidget("25", "Classes"),
                  commonTotalCountWidget("25", "Teacher"),
                ],
              ),
              SizedBox(
                height: 4.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonTotalCountWidget("25", "Courses"),
                  commonTotalCountWidget("25", "Doubts"),
                ],
              ),
              SizedBox(
                height: 4.w,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
// height: 320,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: SfDateRangePicker(
                    controller: _dateRangePickerController,
                    view: DateRangePickerView.month,
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.single,
                    initialSelectedDate: DateTime.now(),
                    selectionColor:     Colors.grey,
                    showNavigationArrow: true,
                    headerStyle:  DateRangePickerHeaderStyle(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                    ),
                    monthViewSettings: DateRangePickerMonthViewSettings(
                      /// week day cell
                      dayFormat: 'EEE',
                      specialDates: [DateTime.now()],
                      viewHeaderStyle:  DateRangePickerViewHeaderStyle(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    selectionTextStyle: const TextStyle(),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      /// date decoration
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                      todayTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      specialDatesDecoration: BoxDecoration(
                          color: Colors.grey,
                          border:
                              Border.all(color: const Color(0xFF2B732F), width: 1),
                          shape: BoxShape.circle),
                      specialDatesTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      disabledDatesTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: const Color(0xFF75B69C).withOpacity(0.5),
                      ),
                    ),
                    todayHighlightColor: Colors.black, //today date color
                  ),
                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                " Most Watches Course",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.w,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 2.w,right: 2.w,top: 2.w),
                          padding: EdgeInsets.only(left: 2.w,right: 2.w),
                          height: 5.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 0.2.w
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 2, // blur radius
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Text(
                            " 1. Class 12English",
                            style: TextStyle(fontSize: 14.sp,color: Colors.white),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonTotalCountWidget(String count, String title) {
    return Container(
      height: 25.w,
      width: 40.w,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: Colors.black,
            width: 0.2.w
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0.8),
              blurRadius: 1,
              color: Colors.black45,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(count,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(
            title,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
