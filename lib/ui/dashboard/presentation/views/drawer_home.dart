import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterprojectsetup/enum/font_type.dart';
import 'package:flutterprojectsetup/ui/common/asset_images.dart';
import 'package:flutterprojectsetup/ui/common/routes.dart';
import 'package:flutterprojectsetup/ui/common/widgets/app_theme.dart';
import 'package:flutterprojectsetup/ui/common/widgets/progress_dialog.dart';
import 'package:flutterprojectsetup/ui/dashboard/data/dashboard_api_provider.dart';
import 'package:flutterprojectsetup/ui/dashboard/presentation/controllers/home_controller.dart';
import 'package:flutterprojectsetup/ui/data/transaction_model.dart';
import 'package:flutterprojectsetup/ui/global_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DrawerTemp extends StatefulWidget {
  DrawerTemp({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<DrawerTemp> createState() => _DrawerTempState();
}

class _DrawerTempState extends State<DrawerTemp> {
  List<DrawerItems> drawerItems = [];
  List<DrawerItems> payment = [];
  bool isViewPaymentHistorySelected = false;
  List<TransactionList> transactionList = [];
  late final Future getData = getDataFromApi();

  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;

  void openDrawer() {
    setState(() {
      xOffset = 250;
      yOffset = 50;
      scaleFactor = 0.85;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  Future<List<TransactionList>> getDataFromApi() async {
    print("Api Calling");
    var result = await http.get(Uri.parse('https://sheetdb.io/api/v1/02vmmt66c39n8'));
    print(result.body);
    response = result.body;
    transactionList = (jsonDecode(response) as List<dynamic>)
        .whereType<Map<String, dynamic>>()
        .map((e) => TransactionList.fromJson(e))
        .whereType<TransactionList>()
        .toList();
    list = transactionList;
    setState(() {});
    return [];
  }

  @override
  void initState() {
    // getDataFromApi();


    closeDrawer();
    drawerItems.add(DrawerItems('Home', 'home'));
    drawerItems.add(DrawerItems('Add Money', 'add_money', isNew: true));
    drawerItems.add(DrawerItems('SC Pay (FPS)', 'sc_pay'));
    drawerItems.add(DrawerItems('QR Cash', 'qr_cash'));
    drawerItems.add(DrawerItems('Transfer', 'transfer', isNew: true));
    drawerItems.add(DrawerItems('Payments', 'payment'));
    drawerItems.add(DrawerItems('360° Rewards', 'rewards', isNew: true));
    drawerItems.add(DrawerItems('Loans', 'loan'));
    drawerItems.add(DrawerItems('Time Deposits', 'time_deposite', isNew: true));
    drawerItems.add(DrawerItems('Foreign Exchange', 'foreign_exchange'));
    drawerItems.add(DrawerItems('Investments', 'invesment'));
    drawerItems
        .add(DrawerItems('Insurance Portfolio', 'insurance', isNew: true));
    drawerItems.add(DrawerItems('Insure', 'insure'));
    drawerItems.add(DrawerItems('MPF', 'mpf', isNew: true));
    drawerItems.add(DrawerItems('WealthPro', 'weath_pro'));
    drawerItems.add(DrawerItems('InvestPower', 'invert_power'));
    drawerItems.add(DrawerItems('eStatement', 'estatement'));
    drawerItems.add(DrawerItems('Services', 'service'));
    drawerItems.add(DrawerItems('FAQs', 'faq'));
    drawerItems.add(DrawerItems('About', 'about'));

    // payment.add(DrawerItems('Scan & Pay', ''));
    // payment.add(DrawerItems('Bills Payment', ''));
    // payment.add(DrawerItems('Pay to SC Credit Cards', ''));
    // payment.add(DrawerItems('Click To Pay', '', isNew: true));
    // payment.add(DrawerItems('View Payment History', ''));
    // payment.add(DrawerItems('View Pending eDDA', ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    return SafeArea(
      child: FutureBuilder(
          future: getData,
          builder: (context, snapshot) {
            if (transactionList.isEmpty) {
              return Container(
                color: Colors.grey[300],
                child: Center(
                  child: Image.asset(
                    'assets/gif/loading.gif',
                    height:500,
                    width:500,
                  ),
                ),
              );
            }
            return Stack(
              children: [
                Material(
                  child: DrawerBody(
                      drawerItems: drawerItems,
                      payments: payment,
                      onPaymentHistoryTap: () {
                        Get.toNamed(RouteName.integrationDeposit);
                        setState(() {
                          isViewPaymentHistorySelected = true;
                        });
                      },
                      isViewPaymentHistorySelected: isViewPaymentHistorySelected,
                      onOtherTap: () {
                        setState(() {
                          isViewPaymentHistorySelected = false;
                        });
                      },
                      transactionList: transactionList),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  transform: Matrix4.translationValues(xOffset, yOffset, 0)
                    ..scale(scaleFactor),
                  color: _appTheme.whiteColor,
                  child: Scaffold(
                    appBar: AppBar(
                      shadowColor: Colors.white,
                      leading: Padding(
                        padding: EdgeInsets.only(
                            left: 40.w, bottom: 40.h, top: 50.h),
                        child: GestureDetector(
                          onTap: () {
                            if (isDrawerOpen) {
                              closeDrawer();
                            } else {
                              openDrawer();
                            }
                          },
                          child: Image.asset(
                            PNGPath.drawerIcon,
                            width: 70.w,
                          ),
                        ),
                      ),
                      leadingWidth: 150.w,
                      automaticallyImplyLeading: false,
                      titleSpacing: 50.w,
                      backgroundColor: _appTheme.color0091ea,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 150.w),
                              Text('Account',
                                  style: _appTheme.customTextStyle(
                                      color: _appTheme.whiteColor,
                                      fontSize: 80,
                                      fontWeightType: FontWeightType.semiBold)),
                              SizedBox(width: 250.w),
                              Text(
                                'Invest',
                                style: _appTheme.customTextStyle(
                                    color: _appTheme.whiteColor,
                                    fontSize: 80,
                                    fontWeightType: FontWeightType.semiBold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 70.w),
                            child: Image.asset(PNGPath.tabIndicator,
                                height: 100.h, width: 500.w),
                          )
                        ],
                      ),
                    ),
                    body: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            PNGPath.promotion,
                            height: 150.h,
                            width: 500.w,
                          ),
                        ),
                        Container(
                          height: 180.h,
                          padding: EdgeInsets.only(left: 60.w, right: 60.w),
                          color: _appTheme.color223255,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'I Have',
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.medium,
                                    fontSize: 60,
                                    color: _appTheme.whiteColor),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    transactionList[0].accountCurrency ?? '',
                                    textAlign: TextAlign.start,
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.medium,
                                        fontSize: 40,
                                        color: _appTheme.whiteColor),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    transactionList[0].accountFund1 ?? '',
                                    textAlign: TextAlign.start,
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.medium,
                                        fontSize: 60,
                                        color: _appTheme.whiteColor),
                                  ),
                                  Text(
                                    ".${transactionList[0].accountFund2 ?? ''}",
                                    textAlign: TextAlign.start,
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.medium,
                                        fontSize: 40,
                                        color: _appTheme.whiteColor),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    transactionList[0].accountFundType ?? '',
                                    textAlign: TextAlign.start,
                                    style: _appTheme.customTextStyle(
                                        fontWeightType: FontWeightType.medium,
                                        fontSize: 60,
                                        color: _appTheme.whiteColor),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            // showProgressDialog(context);

                            // Future.delayed(Duration(seconds: 2)).then((value){
                            Get.toNamed(RouteName.integrationDeposit);
                            // });
                          },
                          child: Container(
                            width: Get.width,
                            color: _appTheme.whiteColor,
                            padding:
                            EdgeInsets.only(left: 60.w, right: 60.w, top: 50.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      PNGPath.integratedAccount,
                                      height: 150.h,
                                      width: 150.w,
                                    ),
                                    SizedBox(width: 20.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 1050.w,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                  transactionList[0]
                                                      .accountNamePartial ??
                                                      '',
                                                  style: _appTheme
                                                      .customTextStyle(
                                                      fontSize: 50,
                                                      color: _appTheme
                                                          .textColor,
                                                      fontWeightType:
                                                      FontWeightType.bold)),
                                              // SizedBox(width: 225.w),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    transactionList[0]
                                                        .accountCurrency ??
                                                        '',
                                                    textAlign: TextAlign.start,
                                                    style: _appTheme
                                                        .customTextStyle(
                                                        fontWeightType:
                                                        FontWeightType.medium,
                                                        fontSize: 40,
                                                        color: _appTheme
                                                            .color2AAC49),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    transactionList[0]
                                                        .accountFund1 ?? '',
                                                    textAlign: TextAlign.start,
                                                    style: _appTheme
                                                        .customTextStyle(
                                                        fontWeightType:
                                                        FontWeightType.medium,
                                                        fontSize: 60,
                                                        color: _appTheme
                                                            .color2AAC49),
                                                  ),
                                                  Text(
                                                    '.${transactionList[0]
                                                        .accountFund2 ?? ''}',
                                                    textAlign: TextAlign.start,
                                                    style: _appTheme
                                                        .customTextStyle(
                                                        fontWeightType:
                                                        FontWeightType.medium,
                                                        fontSize: 40,
                                                        color: _appTheme
                                                            .color2AAC49),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    transactionList[0]
                                                        .accountFundType ??
                                                        '',
                                                    textAlign: TextAlign.start,
                                                    style: _appTheme
                                                        .customTextStyle(
                                                        fontWeightType:
                                                        FontWeightType.medium,
                                                        fontSize: 60,
                                                        color: _appTheme
                                                            .color2AAC49),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        SizedBox(
                                          width: 1050.w,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(transactionList[0]
                                                  .accountNumber ?? '',
                                                  style: _appTheme
                                                      .customTextStyle(
                                                      fontSize: 50,
                                                      color: _appTheme
                                                          .textColor,
                                                      fontWeightType:
                                                      FontWeightType.semiBold)),
                                              // SizedBox(width: 250.w),
                                              Text('Total for 2 currencies',
                                                  style: _appTheme
                                                      .customTextStyle(
                                                      fontSize: 50,
                                                      color: _appTheme
                                                          .textColor,
                                                      fontWeightType:
                                                      FontWeightType.semiBold)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 15,
                                        color: _appTheme.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 150.w),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20.r),
                                          color: _appTheme.colorF0F9FF),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.h, horizontal: 40.w),
                                          child: Text(
                                            'Multi-Currency Account',
                                            style: _appTheme.customTextStyle(
                                                fontWeightType: FontWeightType
                                                    .semiBold,
                                                fontSize: 40),
                                          ))),
                                ),
                                SizedBox(height: 50.h)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 180.h,
                          width: Get.width,
                          padding: EdgeInsets.only(left: 60.w, right: 60.w),
                          color: _appTheme.color223255,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'I\'m Covered (Insurance)',
                                style: _appTheme.customTextStyle(
                                    fontWeightType: FontWeightType.medium,
                                    fontSize: 60,
                                    color: _appTheme.whiteColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 300.h,
                          color: _appTheme.whiteColor,
                          padding: EdgeInsets.only(
                              left: 60.w, right: 60.w, top: 70.h, bottom: 70.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                PNGPath.integratedAccount,
                                height: 150.h,
                                width: 150.w,
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('INSURANCE PORTFOLIO',
                                      style: _appTheme.customTextStyle(
                                          fontSize: 50,
                                          color: _appTheme.textColor,
                                          fontWeightType: FontWeightType.bold)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text('Complete your Portfolio Review',
                                      style: _appTheme.customTextStyle(
                                          fontSize: 50,
                                          color: _appTheme.textColor,
                                          fontWeightType: FontWeightType
                                              .semiBold)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(height: 5.h, color: Colors.grey),
                        Container(
                          height: 300.h,
                          color: _appTheme.whiteColor,
                          padding: EdgeInsets.only(
                              left: 60.w, right: 60.w, top: 70.h, bottom: 70.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                PNGPath.integratedAccount,
                                height: 150.h,
                                width: 150.w,
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('INSURE',
                                      style: _appTheme.customTextStyle(
                                          fontSize: 50,
                                          color: _appTheme.textColor,
                                          fontWeightType: FontWeightType.bold)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text('Discover our Insurance Solutions',
                                      style: _appTheme.customTextStyle(
                                          fontSize: 50,
                                          color: _appTheme.textColor,
                                          fontWeightType: FontWeightType
                                              .semiBold)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(height: 5.h, color: Colors.grey),
                      ],
                    ),
                    floatingActionButton: GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteName.account);
                      },
                      child: Image.asset(
                        PNGPath.message,
                        height: 250.h,
                        width: 250.w,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

// Widget buildAppBar(AppThemeState _appTheme) {
//   return TabBar(
//     controller: controller.tabController,
//     padding: EdgeInsets.only(left: 0.w, bottom: 20.h),
//     // indicatorPadding: EdgeInsets.only(left: 20.w,right: 20.w),
//     indicatorSize: TabBarIndicatorSize.tab,
//     indicator: BoxDecoration(
//         color: _appTheme.color0091ea,
//         image: DecorationImage(image: AssetImage(PNGPath.tabIndicator))),
//     isScrollable: false,
//     indicatorPadding: EdgeInsets.only(top: 0.h, bottom: 0.h),
//     labelPadding:
//         EdgeInsets.only(right: 200.w, left: 80.w, bottom: 50.h, top: 80.h),
//     labelStyle: _appTheme.customTextStyle(
//         color: _appTheme.whiteColor,
//         fontSize: 80,
//         fontWeightType: FontWeightType.semiBold),
//     indicatorColor: _appTheme.whiteColor,
//     indicatorWeight: 5.0,
//     unselectedLabelStyle: _appTheme.customTextStyle(
//         color: _appTheme.whiteColor,
//         fontSize: 80,
//         fontWeightType: FontWeightType.semiBold),
//     tabs: [
//       Text('Account'),
//       Text('Invest'),
//     ],
//   );
// }
}

class DrawerBody extends StatelessWidget {
  final List<DrawerItems> drawerItems;
  final List<DrawerItems> payments;
  final List<TransactionList> transactionList;
  final bool isViewPaymentHistorySelected;
  final VoidCallback onPaymentHistoryTap;
  final VoidCallback onOtherTap;

  const DrawerBody({Key? key,
    required this.drawerItems,
    required this.payments,
    required this.isViewPaymentHistorySelected,
    required this.onPaymentHistoryTap,
    required this.onOtherTap,
    required this.transactionList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(31, 121, 165, 1),
            Color.fromRGBO(17, 108, 95, 1)
          ], begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              transactionList[0].username ?? '',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Inbox',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 5),
                _New(),
                SizedBox(width: 5),
                ColoredBox(
                    color: Colors.white, child: SizedBox(width: 1, height: 10)),
                SizedBox(width: 5),
                Image.asset('assets/png/setting.png', height: 10, width: 10),
                SizedBox(width: 5),
                Text('Setting',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 5),
                ColoredBox(
                    color: Colors.white, child: SizedBox(width: 1, height: 10)),
                SizedBox(width: 5),
                Image.asset('assets/png/logout.png', height: 10, width: 10),
                SizedBox(width: 5),
                Text('Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: Colors.white24),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              transactionList[0].lastLogin ?? '',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 50),
              itemCount: drawerItems.length,
              itemBuilder: (_, index) {
                bool isPayment = false;
                // drawerItems[index].name.toLowerCase() == 'payments';
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: onOtherTap,
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: isPayment
                                  ? Colors.white24
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            children: [
                              if (drawerItems[index].name.toLowerCase() ==
                                  'home')
                                ColoredBox(
                                    color: Colors.white,
                                    child: SizedBox(height: 30, width: 3)),
                              SizedBox(width: 20),
                              Image.asset(
                                  'assets/png/${drawerItems[index].icon}.png',
                                  width: 18,
                                  height: 18),
                              SizedBox(width: 12),
                              Text(
                                drawerItems[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              if (drawerItems[index].isNew) ...[
                                SizedBox(width: 10),
                                _New()
                              ]
                            ],
                          ),
                        ),
                      ),
                      if (isPayment)
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: payments.length,
                            itemBuilder: (_, innerIndex) {
                              return InkWell(
                                onTap:
                                payments[innerIndex].name.toLowerCase() ==
                                    'view payment history'
                                    ? onPaymentHistoryTap
                                    : () {},
                                child: Row(
                                  children: [
                                    SizedBox(width: 30),
                                    ColoredBox(
                                        color: Colors.white38,
                                        child: SizedBox(
                                            height: 30,
                                            width: payments[innerIndex]
                                                .name
                                                .toLowerCase() ==
                                                'view payment history' &&
                                                isViewPaymentHistorySelected
                                                ? 2
                                                : 0.5)),
                                    SizedBox(width: 20),
                                    Text(payments[innerIndex].name,
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 10),
                                    if (payments[innerIndex].isNew) _New()
                                  ],
                                ),
                              );
                            })
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class _New extends StatelessWidget {
  const _New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: Color.fromRGBO(201, 5, 26, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          child: Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

class DrawerItems {
  final String name;
  final String icon;
  final bool isNew;

  DrawerItems(this.name, this.icon, {this.isNew = false});
}
