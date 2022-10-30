import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:edufuture/ui/course_screen.dart';
import 'package:edufuture/ui/live_class_screen.dart';
import 'package:flutter/material.dart';
import 'doubts_screen.dart';
import 'dashboard_screen.dart';


class TabControllerScreen extends StatefulWidget {
  const TabControllerScreen({Key? key}) : super(key: key);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int index = 0;
  List<Widget> pageList = [
   const DashBoardScreen(),
   const LiveClassScreen(),
   const DoubtScreen(),
   const CourseScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pageList.elementAt(index),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.live_tv, title: 'Live Class'),
          TabItem(icon: Icons.add, title: 'Ask'),
          TabItem(icon: Icons.message, title: 'Courses'),
        ],
        initialActiveIndex: index,
        onTap: (int i) {
    setState(() {
      index = i;
    });
        },
      ),
    );
  }
}
