import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterprojectsetup/ui/common/asset_images.dart';
import 'package:flutterprojectsetup/ui/common/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../enum/font_type.dart';
import 'common/widgets/app_theme.dart';

class BeforeAmount extends StatefulWidget {
  const BeforeAmount({Key? key}) : super(key: key);

  @override
  State<BeforeAmount> createState() => _BeforeAmountState();
}

class _BeforeAmountState extends State<BeforeAmount> {
  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Between My Accounts',
            style: _appTheme.customTextStyle(
                color: _appTheme.whiteColor,
                fontSize: 74,
                fontWeightType: FontWeightType.regular)),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                SVGPath.cancel,
                color: Colors.white,
                height: 70.h,
                width: 70.h,
              ),
            ),
          ),
          Container(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(50))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Text(
                                  'From',
                                  style: _appTheme.customTextStyle(
                                      fontWeightType: FontWeightType.regular,
                                      fontSize: 55,
                                      color: _appTheme.blackColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left:45.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DottedLine(
                                direction: Axis.vertical,
                                lineLength: 140.h,
                                lineThickness: 1.0,
                                dashLength: 2.0,
                                dashColor: Colors.black,
                                dashRadius: 0.0,
                                dashGapLength: 2.0,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 480.h,
                                    width: 5.w,
                                    color: Colors.black,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 50.w),
                                        child: Text(
                                          'HKD',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 160.w),
                                        child: Text(
                                          '0.00',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 160,
                                              color: Colors.grey.shade300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 110.h,
                              width: 110.h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(50))),
                              child: Padding(
                                padding:  EdgeInsets.all(6.h),
                                child: Image.asset(PNGPath.transfer,color: Colors.black,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Card(
                                color: Colors.white,
                                elevation: 10.h,
                                shadowColor: Colors.grey.shade300,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40)
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 40.w,right: 40.w,top: 20.h,bottom: 20.h),
                                  child: Row(
                                        children: [
                                          Text(
                                            'HKD 0',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 14.w,right: 14.w),
                                            child: Icon(CupertinoIcons.arrow_right_arrow_left, size: 60.h,color: Colors.black),
                                          ),
                                          Text(
                                            'USD 0',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.semiBold,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 14.w,right: 14.w),
                                            child: Container(
                                              height: 5.h,
                                              width: 5.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  border: Border.all(color: Colors.black),
                                                  borderRadius: BorderRadius.all(Radius.circular(50))),
                                              ),
                                          ),
                                          Text(
                                            'FX Tier:',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                                            child: Icon(CupertinoIcons.question_circle, size: 60.h,color: Colors.blue),
                                          ),
                                          Text(
                                            'Silver',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 35,
                                                color: Colors.grey.shade600),
                                          ),
                                        ],
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                        Padding(
                            padding:  EdgeInsets.only(left:45.w),
                            child:Container(
                              height: 180.h,
                              width: 5.w,
                              color: Colors.black,
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(50))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Text(
                                  'To',
                                  style: _appTheme.customTextStyle(
                                      fontWeightType: FontWeightType.regular,
                                      fontSize: 55,
                                      color: _appTheme.blackColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 50.w,top: 100.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 50.w),
                                    child: Text(
                                      'USD',
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: 55,
                                          color: _appTheme.blackColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 160.w),
                                    child: Text(
                                      '0.00',
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: 160,
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right:60.w),
                          child: Card(
                            color: Color(0xFFCCE5D8),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4)
                              ),
                            ),
                            child:Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250.h,
                              child: Padding(
                                padding: EdgeInsets.only(left: 60.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Transfer ',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          'Once',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'on ',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          'Tue, 05 Jul 2022',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right:60.w,top: 60.h,left: 60.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Please read the ',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: 55,
                                        color: _appTheme.blackColor),
                                  ),
                                  Text(
                                    'Important Notes',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: 55,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    ' before you',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: 55,
                                        color: _appTheme.blackColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'proceed. By continuing, you understand and',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: 55,
                                        color: _appTheme.blackColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'agree to the ',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: 55,
                                        color: _appTheme.blackColor),
                                  ),
                                  Text(
                                    'Terms and Conditions.  ',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: 55,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Integrated Deposits Account(...5641)',
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: 55,
                                          color: _appTheme.blackColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Balance HKD',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          '154.87',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: Column(
                                    children: [
                                      Icon(CupertinoIcons.chevron_down, size: 100.h,color: Colors.blue),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 800.h,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Integrated Deposits Account-sa...',
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: 55,
                                          color: _appTheme.blackColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Balance HKD',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          '154.87',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: Column(
                                    children: [
                                      Icon(CupertinoIcons.chevron_down, size: 100.h,color: Colors.blue),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 60.h,left: 30.w,right: 30.w),
        child: InkWell(
          onTap:(){
            Get.toNamed(RouteName.account3);
          } ,
          child: Card(
            color: Color(0xFF36B42D),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(4)
              ),
            ),
            child:Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              child: Center(
                child: Text(
                  'CONTINUE',
                  style: _appTheme.customTextStyle(
                      fontWeightType: FontWeightType.regular,
                      fontSize: 75,
                      color: _appTheme.whiteColor),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
        },
        child: Image.asset(
          PNGPath.message,
          height: 300.h,
          width: 300.h,
        ),
      ),
    );
  }
}
