import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterprojectsetup/ui/common/asset_images.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../enum/font_type.dart';
import 'common/routes.dart';
import 'common/widgets/app_theme.dart';


class TransferConfirm extends StatefulWidget {
  final String? fromAc;
  final String? fromBal;
  final String? toAc;
  final String? toBal;
  final String? usdToHkd;
  final String? date;
  final String? submitDate;
  final String? hkd;
  final String? usd;
  const TransferConfirm({Key? key, this.fromAc, this.fromBal, this.toAc, this.toBal, this.usdToHkd, this.date, this.submitDate, this.hkd, this.usd}) : super(key: key);

  @override
  State<TransferConfirm> createState() => _TransferConfirmState();
}

class _TransferConfirmState extends State<TransferConfirm> {
  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Icon(CupertinoIcons.chevron_back,
                              size: 110.h, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Icon(Icons.close,
                              size: 110.h, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 140.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reference No : ',
                          style: _appTheme.customTextStyle(
                              fontWeightType: FontWeightType.regular,
                              fontSize: 48,
                              color: _appTheme.whiteColor),
                        ),
                        Text(
                          'HK22070500178394940000',
                          style: _appTheme.customTextStyle(
                              fontWeightType: FontWeightType.regular,
                              fontSize: 48,
                              color: _appTheme.whiteColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Transfer Confirmation',
                          style: _appTheme.customTextStyle(
                              fontWeightType: FontWeightType.regular,
                              fontSize: 75,
                              color: _appTheme.whiteColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 500.h,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 720.h,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: EdgeInsets.only(left: 70.w, right: 70.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        DottedLine(
                                          direction: Axis.vertical,
                                          lineLength: 160.h,
                                          lineThickness: 1.0,
                                          dashLength: 2.0,
                                          dashColor: Colors.black,
                                          dashRadius: 0.0,
                                          dashGapLength: 2.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                        Container(
                                          height: 60.h,
                                          width: 60.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                        ),
                                        Container(
                                          height: 360.h,
                                          width: 5.w,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          height: 60.h,
                                          width: 60.h,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: Image.asset(
                                            PNGPath.tick,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 60.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 150.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'From',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'Integrated Deposits Account - Savings',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.fromAc.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 235.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'TO',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'Integrated Deposits Account - Savings',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.toAc.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 200.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50.h,
                                    width: 50.h,
                                    child: Image.asset(
                                      PNGPath.invert,
                                      color: Colors.black,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 50.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'AMOUNT',
                                        style: _appTheme.customTextStyle(
                                            fontWeightType: FontWeightType.regular,
                                            fontSize: 55,
                                            color: _appTheme.blackColor),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'HKD ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.hkd.toString(),
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
                                            'USG ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.usd.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.bold,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Exchange Rate',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 45,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            '___________ ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.bold,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'USD 1',
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
                                            'HKD '+widget.usdToHkd.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.bold,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(children: [
                                        Text(
                                          'Fx Tier',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 45,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          '__________________________ ',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: 55,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          'Silver',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: 45,
                                              color: _appTheme.blackColor),
                                        ),
                                      ],)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50.h,
                                    width: 50.h,
                                    child: Image.asset(
                                      PNGPath.invert,
                                      color: Colors.black,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 50.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SUBMITTED AT',
                                        style: _appTheme.customTextStyle(
                                            fontWeightType: FontWeightType.regular,
                                            fontSize: 55,
                                            color: _appTheme.blackColor),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '5 July 2022, ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            '18:23 PM',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 55,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 60.h, left: 30.w, right: 30.w),
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(
              color: Color(0xFF36B42D),
              width: 1.0,
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.h,
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(RouteName.slider);
                },
                child: Text(
                  'MAKE ANOTHER TRANSFER',
                  style: _appTheme.customTextStyle(
                      fontWeightType: FontWeightType.regular,
                      fontSize: 75,
                      color: Color(0xFF36B42D)),
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
