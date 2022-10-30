
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'common_text_widget.dart';

class CommonDrop extends StatefulWidget{
  var value;
  List item;
  Function  onChanged;
  String hintText;
  double? width;
  CommonDrop({Key? key,required this.hintText, required this.item, required this.onChanged,required this.value,this.width}) : super(key: key);

  @override
  State<CommonDrop> createState() => _CommonDropState();
}

class _CommonDropState extends State<CommonDrop> {
  @override
  Widget build(BuildContext context) {
    return     Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 4.w,right: 4.w),
      height: 14.w,
      width: widget.width ?? 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:Colors.black,
          width: 1,
        ),
      ),
      child: DropdownButton(
        hint: CommonTextView(widget.hintText,color: Colors.black26,fontSize: 13.sp,),
        dropdownColor: Colors.white,
        iconEnabledColor:Colors.black,
        style: TextStyle(color: Colors.black,fontSize: 14.sp,),
        isExpanded: true,
        value: widget.value,
        icon:  Icon(Icons.keyboard_arrow_down,size: 6.w,),
        borderRadius: BorderRadius.circular(10),
        underline: Container(),
        items: widget.item.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items.toString()),
          );
        }).toList(),
        onChanged: (newValue) {
          widget.onChanged(newValue);
        },
      ),
    );
  }
}