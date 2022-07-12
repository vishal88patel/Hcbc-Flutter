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

class AccountSelection extends StatefulWidget {
  const AccountSelection({Key? key}) : super(key: key);

  @override
  State<AccountSelection> createState() => _AccountSelectionState();
}

class _AccountSelectionState extends State<AccountSelection> {
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 80.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.h,
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
                      Padding(
                        padding:  EdgeInsets.only(left:30.h),
                        child: Column(
                          children: [
                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 120.h,
                              lineThickness: 1.0,
                              dashLength: 2.0,
                              dashColor: Colors.black,
                              dashRadius: 0.0,
                              dashGapLength: 2.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            Container(
                              height: 120.h,
                              width: 5.w,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.h,
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
                      Padding(
                        padding:  EdgeInsets.only(left:30.h),
                        child: DottedLine(
                          direction: Axis.vertical,
                          lineLength: 120.h,
                          lineThickness: 1.0,
                          dashLength: 2.0,
                          dashColor: Colors.black,
                          dashRadius: 0.0,
                          dashGapLength: 2.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        )
                      ),
                    ],
                  ),
                ),
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
                        height: 160.h,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Icon(CupertinoIcons.chevron_down, size: 100.h,color: Colors.blue),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return
                       Padding(
                        padding: EdgeInsets.only(bottom: 20.h,left: 30.w,right: 30.w),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed(RouteName.account2);
                          },
                          child: Card(
                            color: Colors.white,
                              elevation: 80.h,
                            shadowColor: Colors.grey.shade300,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(top:80.h,bottom: 80.h,left: 80.w,right: 80.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 160.h,
                                        width: 160.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(color: Colors.grey.shade200),
                                            borderRadius: BorderRadius.all(Radius.circular(50))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            PNGPath.about,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 20.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Integrated Deposits Account...',
                                              style: _appTheme.customTextStyle(
                                                  fontWeightType: FontWeightType.regular,
                                                  fontSize: 55,
                                                  color: _appTheme.blackColor),
                                            ),
                                            Text(
                                              '574 860 05640',
                                              style: _appTheme.customTextStyle(
                                                  fontWeightType: FontWeightType.bold,
                                                  fontSize: 55,
                                                  color: _appTheme.blackColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'HKD',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType.regular,
                                                fontSize: 45,
                                                color: _appTheme.blackColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.w),
                                            child: Text(
                                              "0.00",
                                              style: _appTheme.customTextStyle(
                                                  fontWeightType: FontWeightType.bold,
                                                  fontSize: 50,
                                                  color: _appTheme.blackColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                      );

                  }),
            ),
          ],
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
