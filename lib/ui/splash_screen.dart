import 'package:edufuture/main.dart';
import 'package:edufuture/ui/login_screen.dart';
import 'package:edufuture/ui/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => storage.read("isLogin") ?? false ?const TabControllerScreen():const LoginScreen()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: 100.h,
        width: 100.w,
        color:  Colors.blueGrey.shade900,
        child: Image.asset("assets/ic_edufuture.png"),
      ),
    );
  }
}
