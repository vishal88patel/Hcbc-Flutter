import 'dart:async';

import 'package:action_slider/action_slider.dart';
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
import 'global_controller.dart';

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

  const TransferConfirm(
      {Key? key,
      this.fromAc,
      this.fromBal,
      this.toAc,
      this.toBal,
      this.usdToHkd,
      this.date,
      this.submitDate,
      this.hkd,
      this.usd})
      : super(key: key);

  @override
  State<TransferConfirm> createState() => _TransferConfirmState();
}

class _TransferConfirmState extends State<TransferConfirm> {
  final _controller = ActionSliderController();
  bool transfer = false;
  bool loader = false;
  Timer? _timer;
  int _time = 60;
  bool resend = false;
  bool button = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_time == 0) {
          setState(() {
            _time = 60;
            resend = true;
          });
        } else {
          setState(() {
            _time--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              /*SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.asset(PNGPath.building,height:290, width: MediaQuery.of(context).size.width, fit: BoxFit.fitHeight),
              ),*/
              Image.asset(PNGPath.building, fit: BoxFit.fitHeight),
              Container(
                color: Colors.transparent,
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
                        InkWell(
                          onTap: () {
                            transfer ? Get.toNamed(RouteName.dashboard) : {};
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Icon(Icons.close,
                                size: 110.h, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    transfer
                        ? SizedBox(
                            height: 160.h,
                          )
                        : Container(
                            height: 140.h,
                            width: 140.h,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 30.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 30.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                )
                              ],
                            )),
                          ),
                    transfer
                        ? Row(
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
                          )
                        : Row(
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
                      height: 10.h,
                    ),
                    transfer
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Transfer Completed',
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.regular,
                                    fontSize: 75,
                                    color: _appTheme.whiteColor),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Guaranteed FX rate expires in ',
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.regular,
                                    fontSize: 45,
                                    color: _appTheme.whiteColor),
                              ),
                              Text(
                                _time.toString(),
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.regular,
                                    fontSize: 45,
                                    color: _appTheme.whiteColor),
                              ),
                              Text(
                                ' seconds',
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.regular,
                                    fontSize: 45,
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
                                          height: 350.h,
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Image.asset(
                                              PNGPath.tick,
                                              color: Colors.white,
                                            ),
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
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'Integrated Deposits Account - Savings',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.fromAc.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
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
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'Integrated Deposits Account - Savings',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.toAc.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
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
                              height: 140.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 60.h,
                                    width: 60.h,
                                    child: SvgPicture.asset(
                                      SVGPath.ammount,
                                      color: Colors.black,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 45.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'AMOUNT',
                                        style: _appTheme.customTextStyle(
                                            fontWeightType:
                                                FontWeightType.regular,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            color: _appTheme.blackColor),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'HKD ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6.5,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.hkd.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6.5,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'USD ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6.5,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            widget.usd.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6.5,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 70.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Exchange Rate',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    9,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            '___________ ',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    8,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'USD 1',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
                                                color: _appTheme.blackColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 14.w, right: 14.w),
                                            child: Image.asset(
                                              PNGPath.bothside,
                                              height: 60.h,
                                              width: 60.h,
                                            ),
                                          ),
                                          Text(
                                            "HKD " + widget.usdToHkd.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    7,
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
                                            'Fx Tier',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    9,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            '________________________________________',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    8,
                                                color: _appTheme.blackColor),
                                          ),
                                          Text(
                                            'Silver',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType:
                                                    FontWeightType.regular,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    9,
                                                color: _appTheme.blackColor),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 90.h,
                            ),
                            transfer
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 55.h,
                                          width: 60.h,
                                          child: Image.asset(
                                            PNGPath.calender,
                                            color: Colors.black,
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(left: 50.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'SUBMITTED AT',
                                              style: _appTheme.customTextStyle(
                                                  fontWeightType:
                                                      FontWeightType.regular,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  color: _appTheme.blackColor),
                                            ),
                                            SizedBox(
                                              height: 25.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  widget.submitDate.toString(),
                                                  style:
                                                      _appTheme.customTextStyle(
                                                          fontWeightType:
                                                              FontWeightType
                                                                  .regular,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              7,
                                                          color: _appTheme
                                                              .blackColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container()
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
        child: button
            ? Card(
                elevation: 0,
                color: loader ? Colors.grey : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  side: BorderSide(
                    color: loader ? Colors.grey : Color(0xFF36B42D),
                    width: 1.0,
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  child: Center(
                    child: loader
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'CONFIRMING...',
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.regular,
                                    fontSize: 75,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        : Text(
                            'MAKE ANOTHER TRANSFER',
                            style: _appTheme.customTextStyle(
                                fontWeightType: FontWeightType.regular,
                                fontSize: 75,
                                color: Color(0xFF36B42D)),
                          ),
                  ),
                ),
              )
            : ActionSlider.custom(
                sliderBehavior: SliderBehavior.move,
                width: MediaQuery.of(context).size.width,
                controller: _controller,
                height: 200.h,
                toggleWidth: MediaQuery.of(context).size.width / 4.5,
                toggleMargin: EdgeInsets.zero,
                backgroundColor: Colors.green,
                foregroundChild: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(Icons.arrow_forward,
                          size: 120.h, color: Color(0xFF36B42D))),
                ),
                foregroundBuilder: (context, state, child) => child!,
                outerBackgroundBuilder: (context, state, child) => Card(
                  margin: EdgeInsets.zero,
                  color: Color.lerp(
                      Color(0xFF36B42D), Colors.green, state.position),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'SWIPE TO TRANSFER',
                          style: _appTheme.customTextStyle(
                              fontWeightType: FontWeightType.regular,
                              fontSize: 65,
                              color: _appTheme.whiteColor),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 7,
                              right: 40.w),
                          child: Container(
                            height: 110.h,
                            width: 110.h,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                _time.toString(),
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.regular,
                                    fontSize: 65,
                                    color: _appTheme.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                backgroundBorderRadius: BorderRadius.circular(5.0),
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  controller.success();
                  loader = true;
                  button = true;
                  setState(() {
                    _timer!.cancel();
                    newApi = true;
                    Future.delayed(Duration(milliseconds: 2000), () {
                      setState(() {
                        loader = false;
                        transfer = true;
                      });
                    });
                  });
                },
              ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Image.asset(
          PNGPath.message,
          height: 300.h,
          width: 300.h,
        ),
      ),
    );
  }
}
