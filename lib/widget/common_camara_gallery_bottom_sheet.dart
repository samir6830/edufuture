

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


Future commonCamaraBottomSheet(BuildContext context,Function camaraOnTap,Function galleryOnTap) {
  return  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0)),
      ),
      context: context,
      builder: (builder) {
        return Container(
          decoration:  const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)),
          ),
          padding: EdgeInsets.only(left: 4.w,top: 2.w,bottom: 2.w,right: 4.w),
          height: 26.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  camaraOnTap();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 6.w,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.w,),
                    Text(
                        "Camara",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp
                        )
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.white,
              ),
              InkWell(
                onTap: (){
                  galleryOnTap();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.file_copy,
                      size: 6.w,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.w,),
                    Text(
                        "Gallery",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}