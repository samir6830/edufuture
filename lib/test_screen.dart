/*
import 'dart:io';
import 'dart:typed_data';
import 'package:dog_buddy/bloc/feedback_bloc.dart';
import 'package:dog_buddy/widgets/common_button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dog_buddy/widgets/common_textField.dart';
import 'package:dog_buddy/widgets/common_text_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../networking/responce.dart';
import '../utils/constants.dart';
import '../widgets/back_with_title_appbar.dart';
import '../widgets/common_camara_bottomsheet.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  XFile? fileImage;
  late FeedbackBloc feedbackBloc;

*/
/*  late GetFaqBloc getFaqBloc;
  GetFaqResponseModel? getFaqResponseModel;*//*


  @override
  void initState() {
    */
/* getFaqBloc = GetFaqBloc();
    getFaqBloc.getFaqData();
    getFaqBloc.getFriendRequestDataStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          setState(() {
            getFaqResponseModel = event.data;
          });

          break;
        case Status.ERROR:
          print("error");
          break;
      }
    });*//*

    feedbackBloc = FeedbackBloc();
    feedbackBloc.dataStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          stopLoader(context);
          Navigator.pop(context);
          break;
        case Status.ERROR:
          stopLoader(context);
          print("error");
          break;
      }
    });

    super.initState();
  }

  /// convert image
  convert(image) {
    var multipartImage;
    if (null != image) {
      image = File(image.path);
      Uint8List bytes = image.readAsBytesSync();
      ByteData byteData = ByteData.view(bytes.buffer);
      List<int> imageData = byteData.buffer.asUint8List();
      multipartImage = http.MultipartFile.fromBytes("profile_photo", imageData,
          filename: 'image', contentType: MediaType("image", "jpg"));
    }
    return multipartImage;
  }

  ///get Image into camara
  Future getImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      Navigator.pop(context);
      fileImage = image!;
      print(File(image.path.toString()));
    });
  }

  ///get Image into gallery

  Future getGalleryImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      Navigator.pop(context);
      fileImage = image!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackWithTitleAppbar(title: "Feedback",onPressed: (){
        Navigator.pop(context);
      },),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          height: 120.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              */
/*Expanded(
                child: ListView(
                  children: [
                    if (getFaqResponseModel != null)
                      for (FaqData data in
                      getFaqResponseModel!.data!)
                        getCommonTile(data.question!, data.answer!),
                  ],
                ),
              ),*//*

              CommonTextView(
                "Name",
                color: darkGreenColor,
                fontSize: 15.sp,
              ),
              CommonTextField(
                  hintText: "Enter Your Name", controller: nameController),
              CommonTextView(
                "Email",
                color: darkGreenColor,
                fontSize: 15.sp,
              ),
              CommonTextField(
                  hintText: "Enter Your Email", controller: emailController),
              CommonTextView(
                "Message",
                color: darkGreenColor,
                fontSize: 15.sp,
              ),
              SizedBox(
                height: 30.w,
                width: 100.w,
                child: TextField(
                  maxLength: 100,
                  maxLines: 4,
                  minLines: 4,
                  style: TextStyle(color: greenColor, fontSize: 12.sp),
                  cursorColor: darkGreenColor,
                  controller: messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 1,color: greenColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 1,color: greenColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 1,color: darkGreenColor),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
                    fillColor: backColor,
                    filled: true,
                    hintText: hintTextTypeMessage,
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 14.sp,
                    ),

                  ),
                ),
              ),
              CommonTextView(
                "Upload Image",
                color: darkGreenColor,
                fontSize: 15.sp,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (fileImage == null) {
                        commonCamaraBottomSheet(context, () {
                          getImage();
                        }, () {
                          getGalleryImage();
                        });
                      }
                    },
                    child: SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child: Image.asset(
                        "assets/icons/ic_add_pet.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.w),
                    clipBehavior: Clip.antiAlias,
                    height: 20.w,
                    width: 20.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: fileImage != null
                        ? Image.file(
                      File(fileImage!.path),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                ],
              ),
              CommonButton(onPressed: () {
                setState(() {
                  var feedbackRequest;
                  var profilePhoto = convert(fileImage);
                  feedbackRequest = {
                    "name": nameController.text,
                    "email":emailController.text,
                    "message":messageController.text,
                    "profile_photo": profilePhoto,
                  };
                  if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && messageController.text.isNotEmpty && profilePhoto != null) {
                    feedbackBloc.addFeedback(feedbackRequest);
                  }else{
                    Get.snackbar("Alert", "Please All Field Full Fill");
                  }
                });
              }, btnText: "Submit"),
            ],
          ),
        ),
      ),
    );
  }
}

*/
