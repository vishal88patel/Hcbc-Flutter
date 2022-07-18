import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterprojectsetup/ui/common/asset_images.dart';
import 'package:flutterprojectsetup/ui/common/routes.dart';
import 'package:flutterprojectsetup/ui/transfer_confirm.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../enum/font_type.dart';
import 'common/widgets/app_theme.dart';

class BeforeAmount extends StatefulWidget {
  final String? fromAc;
  final String? fromBal;
  final String? toAc;
  final String? toBal;
  final String? usdToHkd;
  final String? date;
  final String? submitDate;
  final String? hkd;
  final String? usd;
  const BeforeAmount({Key? key, this.fromAc, this.fromBal, this.toAc, this.toBal, this.usdToHkd, this.date, this.submitDate, this.hkd, this.usd}) : super(key: key);

  @override
  State<BeforeAmount> createState() => _BeforeAmountState();
}

class _BeforeAmountState extends State<BeforeAmount> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  bool after=false;
  double usdToHkd=0.00;

  @override
  void initState() {
    super.initState();
    usdToHkd=double.parse(widget.usdToHkd.toString());
  }


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
                fontSize: 70,
                fontWeightType: FontWeightType.regular)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
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
                                      fontSize: MediaQuery.of(context).size.width/7,
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
                                          'HKD ',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: MediaQuery.of(context).size.width/7,
                                              color: _appTheme.blackColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 160.w),
                                        // child: Text(
                                        //   '0.00',
                                        //   style: _appTheme.customTextStyle(
                                        //       fontWeightType: FontWeightType.regular,
                                        //       fontSize: 160,
                                        //       color: Colors.grey.shade300),
                                        // ),
                                        child:  Container(
                                          width: 200,
                                          height: 60,
                                          child: TextField(
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                                            keyboardType: TextInputType.number,
                                            onChanged: (text) {
                                             setState((){
                                               after=true;
                                             });
                                              if(text.isEmpty){
                                                var USD = 0.00;
                                                secondController.text=USD.toStringAsFixed(2);
                                              }
                                              else{
                                                print('First text field: $text');
                                                var USD = double.parse(text)/usdToHkd;
                                                secondController.text=USD.toStringAsFixed(2);
                                              }
                                            },
                                            autofocus: false,
                                            controller: firstController,
                                            style: TextStyle(fontSize: 40.0, color: Color(0xFF36B42D)),
                                            decoration: InputDecoration(
                                              contentPadding:
                                              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: '0.00',
                                              hintStyle: TextStyle(fontSize: 40.0, color: Colors.grey.shade400),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.circular(25.7),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.circular(25.7),
                                              ),
                                            ),
                                          ),
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
                              height: 95.h,
                              width: 95.h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(50))),
                              child: Padding(
                                padding:  EdgeInsets.all(6.h),
                                child: Image.asset(PNGPath.upDown,color: Colors.black,height: 40.h,width: 40.h,),
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
                                                fontSize: MediaQuery.of(context).size.width/7,
                                                color: _appTheme.blackColor),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 14.w,right: 14.w),
                                            child: Image.asset(
                                              PNGPath.bothside,
                                              height: 60.h,
                                              width: 60.h,
                                            ),
                                          ),
                                          after?Text(
                                            'USD '+widget.usdToHkd.toString(),
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.semiBold,
                                                fontSize: MediaQuery.of(context).size.width/7,
                                                color: _appTheme.blackColor),
                                          ):Text(
                                            'USD 0',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.semiBold,
                                                fontSize: MediaQuery.of(context).size.width/7,
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
                                                fontSize: MediaQuery.of(context).size.width/7,
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
                                                fontSize: MediaQuery.of(context).size.width/10,
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
                                      fontSize: MediaQuery.of(context).size.width/7,
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
                                      'USD ',
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: MediaQuery.of(context).size.width/7,
                                          color: _appTheme.blackColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 160.w),
                                    child:
                                    Container(
                                      width: 200,
                                      height: 60,
                                      child: TextField(
                                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                                        keyboardType: TextInputType.number,
                                        onChanged: (text) {
                                          setState((){
                                            after=true;
                                          });
                                          if(text.isEmpty){
                                            var HKD = 0.00;
                                            firstController.text=HKD.toStringAsFixed(2);
                                          }
                                          else{
                                            print('First text field: $text');
                                            var HKD = double.parse(text)*usdToHkd;
                                            firstController.text=HKD.toStringAsFixed(2);
                                          }
                                        },
                                        autofocus: false,
                                        controller: secondController,
                                        style: TextStyle(fontSize: 40.0, color:Color(0xFF36B42D)),
                                        decoration: InputDecoration(
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          hintText: '0.00',
                                          hintStyle: TextStyle(fontSize: 40.0, color: Colors.grey.shade400),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.transparent),
                                            borderRadius: BorderRadius.circular(25.7),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.transparent),
                                            borderRadius: BorderRadius.circular(25.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*TextFormField(
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      controller: firstController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText:"0.00",
                                        hintStyle: TextStyle(fontSize: 160,color: Colors.grey.shade300)
                                      ),
                                      style: TextStyle(fontSize: 160.0, color:Color(0xFF36B42D)),
                                    )*/
                                    /*Text(
                                      '0.00',
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: 160,
                                          color: Colors.grey.shade300),
                                    ),*/
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        after?Padding(
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
                                              fontSize: MediaQuery.of(context).size.width/7,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          'Once',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: MediaQuery.of(context).size.width/7,
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
                                              fontSize: MediaQuery.of(context).size.width/7,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          widget.date.toString(),
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: MediaQuery.of(context).size.width/7,
                                              color: _appTheme.blackColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ):Container(),
                        after?Padding(
                          padding:  EdgeInsets.only(right:60.w,top: 60.h,left: 60.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Please read the ',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: MediaQuery.of(context).size.width/7,
                                        color: _appTheme.blackColor),
                                  ),
                                  Text(
                                    'Important Notes',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: MediaQuery.of(context).size.width/7,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    ' before you',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: MediaQuery.of(context).size.width/7,
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
                                        fontSize: MediaQuery.of(context).size.width/7,
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
                                        fontSize: MediaQuery.of(context).size.width/7,
                                        color: _appTheme.blackColor),
                                  ),
                                  Text(
                                    'Terms and Conditions.  ',
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.regular,
                                        fontSize: MediaQuery.of(context).size.width/7,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ):Container(),
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
                                      'Integrated Deposits Account('+widget.fromAc.toString()+")",
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: MediaQuery.of(context).size.width/7,
                                          color: _appTheme.blackColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Balance HKD ',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: MediaQuery.of(context).size.width/7,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          widget.fromBal.toString(),
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: MediaQuery.of(context).size.width/7,
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
                              height: 870.h,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Integrated Deposits Account('+widget.toAc.toString()+")",
                                      style: _appTheme.customTextStyle(
                                          fontWeightType: FontWeightType.regular,
                                          fontSize: MediaQuery.of(context).size.width/7,
                                          color: _appTheme.blackColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Balance HKD ',
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.regular,
                                              fontSize: MediaQuery.of(context).size.width/7,
                                              color: _appTheme.blackColor),
                                        ),
                                        Text(
                                          widget.toBal.toString(),
                                          style: _appTheme.customTextStyle(
                                              fontWeightType: FontWeightType.bold,
                                              fontSize: MediaQuery.of(context).size.width/7,
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) =>  TransferConfirm(
                fromAc: widget.fromAc,
                fromBal: widget.fromBal,
                toAc: widget.toAc,
                toBal:widget.toBal,
                usdToHkd:widget.usdToHkd,
                hkd: firstController.text.toString(),
                usd: secondController.text.toString(),
                date: widget.date,
                submitDate: widget.submitDate,
              ),
            )
            );
          },
          child: after?Card(
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
          ):Container(height: 10,width: 10,),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){},
        child: Image.asset(
          PNGPath.message,
          height: 300.h,
          width: 300.h,
        ),
      ),
    );
  }
}
