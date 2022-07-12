import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterprojectsetup/enum/font_type.dart';
import 'package:flutterprojectsetup/ui/common/widgets/app_theme.dart';
import 'package:flutterprojectsetup/ui/transaction_details/transaction_detail_controller.dart';
import 'package:get/get.dart';

import '../common/asset_images.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: _appTheme.color0091ea,
        title: Text(
          'Transaction Details',
          style: _appTheme.customTextStyle(
              color: _appTheme.whiteColor,
              fontSize: 70,
              fontWeightType: FontWeightType.semiBold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Container(
            width: Get.width,
            color: _appTheme.whiteColor,
            padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                ),
                Text(
                  controller.transactionDetailRequest?.description ?? '',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                )
              ],
            ),
          ),
          Container(
            color: _appTheme.colorE3E3E3,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'From',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                ),
                Text(
                  controller.transactionDetailRequest?.tnxFromLine1 ?? '',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                ),
                Text(
                  controller.transactionDetailRequest?.tnxFromLine2 ?? '',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                )
              ],
            ),
          ),
          Container(
            color: _appTheme.whiteColor,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      controller.transactionDetailRequest?.tnxAmountCurrency ??
                          '',
                      textAlign: TextAlign.start,
                      style: _appTheme.customTextStyle(
                          fontWeightType: FontWeightType.medium,
                          fontSize: 40,
                          color: controller.transactionDetailRequest?.tnxType !=
                                  'debit'
                              ? Colors.green
                              : Colors.red),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      controller.transactionDetailRequest?.tnxAmount1 ?? '',
                      textAlign: TextAlign.start,
                      style: _appTheme.customTextStyle(
                          fontWeightType: FontWeightType.medium,
                          fontSize: 60,
                          color: controller.transactionDetailRequest?.tnxType !=
                                  'debit'
                              ? Colors.green
                              : Colors.red),
                    ),
                    Text(
                      '.${controller.transactionDetailRequest?.tnxAmount2 ?? ''}',
                      textAlign: TextAlign.start,
                      style: _appTheme.customTextStyle(
                          fontWeightType: FontWeightType.medium,
                          fontSize: 40,
                          color: controller.transactionDetailRequest?.tnxType !=
                              'debit'
                              ? Colors.green
                              : Colors.red),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                    controller.transactionDetailRequest?.drCr ?? '',
                      textAlign: TextAlign.start,
                      style: _appTheme.customTextStyle(
                          fontWeightType: FontWeightType.medium,
                          fontSize: 60,
                          color: controller.transactionDetailRequest?.tnxType !=
                              'debit'
                              ? Colors.green
                              : Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: _appTheme.colorE3E3E3,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 50.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                ),
                Text(
                  controller.transactionDetailRequest?.tnxDate ?? '',
                  style: _appTheme.customTextStyle(
                      fontSize: 60,
                      fontWeightType: FontWeightType.medium,
                      color: _appTheme.textColor),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Image.asset(
        PNGPath.message,
        height: 250.h,
        width: 250.w,
      ),
    );
  }
}
