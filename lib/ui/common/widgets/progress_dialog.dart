import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showProgressDialog(BuildContext context){
  showDialog(
    // barrierColor: Colors.black54.withOpacity(0.5),
    context: context,
    builder: (BuildContext dialogContext) {
      return progressWidget();
    },
  );
}

Widget progressWidget(){
  return AlertDialog(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    content: SizedBox(
      height: 150.h,
      child: Center(
        child: Image.asset(
          'assets/gif/loading.gif', // Put your gif into the assets folder
          width: 200.w,
        ),
      ),
    ),
  );
}