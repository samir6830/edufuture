import 'dart:io';
import 'dart:typed_data';
import 'package:edufuture/widget/common_drop_down.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import '../widget/common_camara_gallery_bottom_sheet.dart';
import '../widget/common_text_widget.dart';

class DoubtScreen extends StatefulWidget {
  const DoubtScreen({Key? key}) : super(key: key);

  @override
  State<DoubtScreen> createState() => _DoubtScreenState();
}

class _DoubtScreenState extends State<DoubtScreen> {
  var classDropDownValue;
  var teacherDropDownValue;
  var gradeDropDownValue;
  List<String> classList = ["Class 10",'Class 11',"Class 12"];
  List<String> teacherList = ["dhaval","samir","mohit"];
  List<String> gradeList = ["Grade 1","Grade 2","Grade 3"];
  XFile? fileImage;


  @override
  void initState() {


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
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Doubts"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w,top: 5.w),
          height: 122.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextView(
                "Class",
                color: Colors.black,
                fontSize: 15.sp,
              ),
             CommonDrop(hintText: "Select Class", item: classList, onChanged: (value){
               setState(() {
                 classDropDownValue = value;
               });
             }, value: classDropDownValue),
              CommonTextView(
                "Teacher",
                color: Colors.black,
                fontSize: 15.sp,
              ),
              CommonDrop(hintText: "Select Teacher", item: teacherList, onChanged: (value){
                setState(() {
                  teacherDropDownValue = value;
                });
              }, value: teacherDropDownValue),
              CommonTextView(
                "Grade",
                color: Colors.black,
                fontSize: 15.sp,
              ),
              CommonDrop(hintText: "Select Grade", item: gradeList, onChanged: (value){
                setState(() {
                  gradeDropDownValue = value;
                });
              }, value: gradeDropDownValue),
              CommonTextView(
                "Upload Image",
                color: Colors.black,
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
                    child: Container(
                      height: 20.w,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.3.w
                        )
                      ),
                      child: Icon(
                        Icons.add_circle_outline_outlined,
                        size: 10.w,
                      )
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
              SizedBox(
                height: 10.w,
                width: 100.w,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    surfaceTintColor: Colors.transparent,
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
