import 'package:edufuture/main.dart';
import 'package:edufuture/networking/bloc/login_bloc.dart';
import 'package:edufuture/networking/model/request%20model/login_request_model.dart';
import 'package:edufuture/ui/tab_controller.dart';
import 'package:edufuture/widget/common_text_widget.dart';
import 'package:edufuture/widget/common_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import '../networking/response.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
@override
  void initState() {
    loginBloc = LoginBloc();

    loginBloc.loginStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          stopLoader(context);
          setState(() {
            storage.write("isLogin", true);
            storage.write("userId", event.data.success.userId);
            storage.write("email", event.data.success.email);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TabControllerScreen()));
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
            backgroundColor: Colors.blueGrey.shade900,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                  height: 20.h,
                  child: Image.asset("assets/ic_edufuture.png",fit: BoxFit.cover,),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.w),
                    margin: EdgeInsets.only(top: 5.h,left: 4.w,right: 4.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: CommonTextView("Student Login",color: Colors.blue,fontSize: 20.sp,)),
                            CommonTextView("Email",color: Colors.blue,),
                            CommonTextField(hintText: "Enter Email", controller: emailController),
                            CommonTextView("Password",color: Colors.blue,),
                            CommonTextField(hintText: "Enter Password", controller: passwordController),
                            SizedBox(
                              width: 100.w,
                              child: ElevatedButton(onPressed: (){
                               loginBloc.loginUser(LoginRequestModel(
                                 email: emailController.text,
                                 password: passwordController.text
                               ));
                              }, child: CommonTextView("Login")),
                            )
                          ],
                        ),
                    /*    Card(
                          child: Padding(
                            padding:  EdgeInsets.all(2.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: CommonTextView("Forget Password",color: Colors.blue,fontSize: 20.sp,)),
                                CommonTextView("Password",color: Colors.blue,),
                                CommonTextField(hintText: "Enter Email", controller: emailController),
                                CommonTextView("Re-Enter Password",color: Colors.blue,),
                                CommonTextField(hintText: "Enter Password", controller: passwordController),
                                SizedBox(
                                  width: 100.w,
                                  child: ElevatedButton(onPressed: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context) => TabControllerScreen()));
                                  }, child: CommonTextView("Confirm")),
                                )
                              ],
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
