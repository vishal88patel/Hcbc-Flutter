import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/ui/common/asset_images.dart';
import 'package:flutterprojectsetup/ui/common/routes.dart';
import 'package:flutterprojectsetup/ui/common/transaction_details_request.dart';
import 'package:flutterprojectsetup/ui/common/widgets/progress_dialog.dart';
import 'package:flutterprojectsetup/ui/data/transaction_model.dart';
import 'package:flutterprojectsetup/ui/global_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IntegrationDepositePage extends StatefulWidget {
  const IntegrationDepositePage({Key? key}) : super(key: key);

  @override
  State<IntegrationDepositePage> createState() =>
      _IntegrationDepositePageState();
}

class _IntegrationDepositePageState extends State<IntegrationDepositePage> {
  List<ListD> transactionListHkd = [];
  List<ListD> transactionListUsd = [];
  List<TransactionList> listOfTransaction = [];
  var dateTimeFormatList = [];
  var finalDateList = [];
  var dateStringList = [];
  var dateTimeFormatListUsd = [];
  var finalDateListUsd = [];
  var dateStringListUsd = [];
  bool isHkdSelected = true;
  bool isLoading = true;
  late final Future hkdFuture = addDataHkd();
  late final Future usdFuture = addDataUsd();

  void getGroupData() {
    List<TransactionList> hkdTransaction =
        list.where((element) => element.tnxCurrency == 'HKD').toList();
    Iterable<String?> dateList = hkdTransaction.map((e) => e.date).toSet();
    print(dateList);

    dateList.forEach((element) {
      DateTime tempDate = DateFormat('dd-MM-yyyy').parse(element!);
      dateTimeFormatList.add(tempDate);
    });

    dateTimeFormatList.sort(
        (a, b) => a.millisecondsSinceEpoch.compareTo(b.millisecondsSinceEpoch));
    print('=================================');
    print(dateTimeFormatList);

    dateTimeFormatList.forEach((element) {
      String date = DateFormat('dd-MM-yyyy').format(element);
      finalDateList.add(date);
    });

    print('=========================');
    print(finalDateList);

    for (var i = 0; i < finalDateList.length; i++) {
      TransactionList data =
          list.firstWhere((element) => element.date == finalDateList[i]);
      dateStringList.add(data.dateString);
    }
    dateStringList = dateStringList.reversed.toList();
    print(dateStringList.length);
  }

  void getUsdData() {
    List<TransactionList> usdTransaction =
        list.where((element) => element.tnxCurrency == 'USD').toList();
    Iterable<String?> dateList = usdTransaction.map((e) => e.date).toSet();
    print(dateList);

    dateList.forEach((element) {
      DateTime tempDate = DateFormat('dd-MM-yyyy').parse(element!);
      dateTimeFormatListUsd.add(tempDate);
    });

    dateTimeFormatListUsd.sort(
        (a, b) => a.millisecondsSinceEpoch.compareTo(b.millisecondsSinceEpoch));
    print('=================================');
    print(dateTimeFormatListUsd);

    dateTimeFormatListUsd.forEach((element) {
      String date = DateFormat('dd-MM-yyyy').format(element);
      finalDateListUsd.add(date);
    });

    print('=========================');
    print(finalDateListUsd);

    for (var i = 0; i < finalDateListUsd.length; i++) {
      TransactionList data =
          list.firstWhere((element) => element.date == finalDateListUsd[i]);
      dateStringListUsd.add(data.dateString);
    }
    dateStringListUsd = dateStringListUsd.reversed.toList();
  }

  Future<List<ListD>> addDataUsd() async {
   Future.delayed(const Duration(seconds: 2)).then((value) {
     for (var i = 0; i < dateStringListUsd.length; i++) {
       List<TransactionList> usdTransaction =
       list.where((element) => element.tnxCurrency == 'USD').toList();
       List<TransactionList> singleList = usdTransaction
           .where((element) => element.dateString == dateStringListUsd[i])
           .toList();
       List<Transaction> allList = [];
       for (var j = 0; j < singleList.length; j++) {
         allList.add(Transaction(
             singleList[j].tnxName ?? '',
             singleList[j].tnxCurrency ?? '',
             singleList[j].tnxAmount1 ?? '',
             singleList[j].tnxAmount2 ?? '',
             singleList[j].tnxType != 'debit' ? true : false,
             TransactionDetailRequest(
               description: singleList[j].tnxDesc ?? '',
               tnxFromLine1: singleList[j].tnxFromLine1 ?? '',
               tnxFromLine2: singleList[j].tnxFromLine2 ?? '',
               tnxAmount1: singleList[j].tnxAmount1 ?? '',
               tnxAmount2: singleList[j].tnxAmount2 ?? '',
               tnxAmountCurrency: singleList[j].tnxAmountCurr ?? '',
               tnxDate: singleList[j].tnxDate ?? '',
               tnxType: singleList[j].tnxType ?? '',
               drCr: singleList[j].drCr ?? '',)));
       }
       transactionListUsd.add(ListD(dateStringListUsd[i], allList));
     }
     setState((){});
   });
   print('===>${transactionListUsd.length}');
    return [];
  }

  Future<List<ListD>> addDataHkd() async {
   Future.delayed(const Duration(seconds: 2)).then((value) {
     for (var i = 0; i < dateStringList.length; i++) {
       List<TransactionList> hkdTransaction =
       list.where((element) => element.tnxCurrency == 'HKD').toList();
       List<TransactionList> singleList = hkdTransaction
           .where((element) => element.dateString == dateStringList[i])
           .toList();
       List<Transaction> allList = [];
       for (var j = 0; j < singleList.length; j++) {
         allList.add(Transaction(
           singleList[j].tnxName ?? '',
           singleList[j].tnxCurrency ?? '',
           singleList[j].tnxAmount1 ?? '',
           singleList[j].tnxAmount2 ?? '',
           singleList[j].tnxType != 'debit' ? true : false,
           TransactionDetailRequest(
               description: singleList[j].tnxDesc ?? '',
               tnxFromLine1: singleList[j].tnxFromLine1 ?? '',
               tnxFromLine2: singleList[j].tnxFromLine2 ?? '',
               tnxAmount1: singleList[j].tnxAmount1 ?? '',
               tnxAmount2: singleList[j].tnxAmount2 ?? '',
               tnxAmountCurrency: singleList[j].tnxAmountCurr ?? '',
               tnxDate: singleList[j].tnxDate ?? '',
               tnxType: singleList[j].tnxType ?? '',
               drCr: singleList[j].drCr ?? ''),
         ));
       }
       transactionListHkd.add(ListD(dateStringList[i], allList));
     }
     setState((){});
   });
   print('===>${transactionListHkd.length}');
    return [];
  }

  @override
  void initState() {
    super.initState();

    getGroupData();
    // addDataHkd();
    getUsdData();
    // addDataUsd();

    // transactionList.add(ListD('Thrusday,16 June 2022', [
    //   Transaction('TRANSFER WITHDRAW', 'HKD', '98','00', true),
    //   Transaction('TRANSFER DEPOSIT', 'HKD', '696107','11', false)
    // ]));

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset('assets/png/message.png', width: 60)),
        body: Column(
          children: [
            Container(
              height: 90,
              color: const Color.fromRGBO(0, 145, 231, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: const Icon(
                          Icons.chevron_left_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                       Text(
                       list[0].accountName ?? '',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: const Divider(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Total in 2 Currencies',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          children: [
                            Text(list[0].accountCurrency ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 2),
                            Text(list[0].accountFund1 ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            Text('.${list[0].accountFund2 ?? ''}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 10),
                            Text(list[0].accountFundType ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'ALL TRANSACTIONS',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 91, 143, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: Color.fromRGBO(0, 91, 143, 1),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'DETAILS',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        /* SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: Color.fromRGBO(0, 91, 143, 1),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CurrencyHeader(
                size: size,
                isHkdSelected: isHkdSelected,
                callback: () {
                  setState(() {
                    isHkdSelected = true;
                  });
                },
                callbackUsd: () {
                  setState(() {
                    isHkdSelected = false;
                  });
                }),
            Expanded(
                child: isHkdSelected
                    ? FutureBuilder(
                  future: hkdFuture,
                      builder: (context,snapshot){
                    if(transactionListHkd.isEmpty)
                      {
                        return Container(
                          color: Colors.grey[300],
                          child: Image.asset(
                            'assets/gif/loading.gif',
                            height: 500,
                            width: 500,
                          ),
                        );
                      }
                    return ListView.builder(
                        itemCount: transactionListHkd.length,
                        itemBuilder: (_, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ColoredBox(
                                  color: const Color.fromRGBO(227, 227, 227, 1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        transactionListHkd[index].header,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  )),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, innerIndex) {
                                  bool isDeposit = transactionListHkd[index]
                                      .transactionList[innerIndex]
                                      .isDebut;
                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Get.toNamed(RouteName.transactionHistory,
                                          arguments: transactionListHkd[index]
                                              .transactionList[innerIndex]
                                              .transactionDetailRequest);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Text(
                                              transactionListHkd[index]
                                                  .transactionList[innerIndex]
                                                  .text,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      117, 117, 117, 1),
                                                  fontSize: 15),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    transactionListHkd[index]
                                                        .transactionList[
                                                    innerIndex]
                                                        .currency,
                                                    style: TextStyle(
                                                        color: isDeposit
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                                const SizedBox(width: 2),
                                                Text(
                                                    transactionListHkd[index]
                                                        .transactionList[
                                                    innerIndex]
                                                        .amount1,
                                                    style: TextStyle(
                                                        color: isDeposit
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                                Text(
                                                    ".${transactionListHkd[index].transactionList[innerIndex].amount2}",
                                                    style: TextStyle(
                                                        color: isDeposit
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                                const SizedBox(width: 10),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.chevron_right,
                                              color: const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: transactionListHkd[index]
                                    .transactionList
                                    .length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                const Divider(),
                              )
                            ],
                          );
                        });
                      },
                    )
                    :FutureBuilder(
                  future: usdFuture,
                  builder: (context,snapshot){
                    if(transactionListUsd.isEmpty)
                    {
                      return Container(
                        color: Colors.grey[300],
                        child: Image.asset(
                          'assets/gif/loading.gif',
                          height: 500,
                          width: 500,
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: transactionListUsd.length,
                        itemBuilder: (_, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ColoredBox(
                                  color: const Color.fromRGBO(227, 227, 227, 1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        transactionListUsd[index].header,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  )),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, innerIndex) {
                                  bool isDeposit = transactionListUsd[index]
                                      .transactionList[innerIndex]
                                      .isDebut;
                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Get.toNamed(RouteName.transactionHistory,
                                          arguments: transactionListUsd[index]
                                              .transactionList[innerIndex]
                                              .transactionDetailRequest);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Text(
                                              transactionListUsd[index]
                                                  .transactionList[innerIndex]
                                                  .text,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      117, 117, 117, 1),
                                                  fontSize: 15),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    transactionListUsd[index]
                                                        .transactionList[
                                                    innerIndex]
                                                        .currency,
                                                    style: TextStyle(
                                                        color: isDeposit
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                                const SizedBox(width: 2),
                                                Text(
                                                    transactionListUsd[index]
                                                        .transactionList[
                                                    innerIndex]
                                                        .amount1,
                                                    style: TextStyle(
                                                        color: isDeposit
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                                Text(
                                                    ".${transactionListUsd[index].transactionList[innerIndex].amount2}",
                                                    style: TextStyle(
                                                        color: isDeposit
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                                const SizedBox(width: 10),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.chevron_right,
                                              color: const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: transactionListUsd[index]
                                    .transactionList
                                    .length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                const Divider(),
                              )
                            ],
                          );
                        });
                  },
                )
                ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('assets/png/exchange_currencies.png'),
            )
          ],
        ),
      ),
    );
  }
}

// class CurrencyHeader extends StatelessWidget {
//   const CurrencyHeader({
//     Key? key,
//     required this.size,
//   }) : super(key: key);
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           Stack(
//             children: [
//               GestureDetector(
//                 onTap: (){
//
//                 },
//                   child: Image.asset('assets/png/hkd.png', width: size.width * 0.3)),
//               Positioned(
//                   bottom: 10,
//                   left: 10,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         NumberFormat('#,##0', 'en_US').format(209),
//                         style: TextStyle(
//                             height: 1,
//                             color: Color.fromRGBO(39, 172, 80, 1),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 20),
//                       ),
//                       Text(
//                         '.49',
//                         style: TextStyle(
//                             height: 1.3,
//                             color: Color.fromRGBO(39, 172, 80, 1),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10),
//                       )
//                     ],
//                   ))
//             ],
//           ),
//           SizedBox(width: 5),
//           Stack(
//             children: [
//               Image.asset('assets/png/usd.png', width: size.width * 0.3),
//               Positioned(
//                   bottom: 10,
//                   left: 10,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         NumberFormat('#,##0', 'en_US').format(0),
//                         style: TextStyle(
//                             height: 1,
//                             color: Color.fromRGBO(39, 172, 80, 1),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 20),
//                       ),
//                       Text(
//                         '.26',
//                         style: TextStyle(
//                             height: 1.3,
//                             color: Color.fromRGBO(39, 172, 80, 1),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10),
//                       )
//                     ],
//                   )),
//             ],
//           ),
//           SizedBox(width: 5),
//           Stack(
//             children: [
//               Image.asset('assets/png/cny.png', width: size.width * 0.3),
//               Positioned(
//                 bottom: 15,
//                 left: 10,
//                 child: Text(
//                   'Activate Now',
//                   style: TextStyle(
//                       color: Color.fromRGBO(0, 145, 231, 1),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class CurrencyHeader extends StatefulWidget {
  CurrencyHeader(
      {Key? key,
      required this.size,
      required this.isHkdSelected,
      required this.callback,
      required this.callbackUsd})
      : super(key: key);

  final Size size;
  VoidCallback callback;
  VoidCallback callbackUsd;
  bool isHkdSelected;

  @override
  State<CurrencyHeader> createState() => _CurrencyHeaderState();
}

class _CurrencyHeaderState extends State<CurrencyHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Stack(
            children: [
              GestureDetector(
                  onTap: widget.callback,
                  child: Image.asset(
                      widget.isHkdSelected
                          ? 'assets/png/hkd.png'
                          : PNGPath.hkdUnselected,
                      width: widget.size.width * 0.3)),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[0].hkdTotal1 ?? '',
                        style: const TextStyle(
                            height: 1,
                            color: Color.fromRGBO(39, 172, 80, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                       Text(
                        ".${list[0].hkdTotal2 ?? ''}",
                        style: const TextStyle(
                            height: 1.3,
                            color: Color.fromRGBO(39, 172, 80, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(width: 5),
          Stack(
            children: [
              GestureDetector(
                  onTap: widget.callbackUsd,
                  child: Image.asset(
                      widget.isHkdSelected
                          ? 'assets/png/usd.png'
                          : PNGPath.usdSelected,
                      width: widget.size.width * 0.3)),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[0].usdTotal1 ?? '',
                        style: const TextStyle(
                            height: 1,
                            color: const Color.fromRGBO(39, 172, 80, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                       Text(
                         '.${list[0].usdTotal2 ?? ''}',
                        style: const TextStyle(
                            height: 1.3,
                            color: Color.fromRGBO(39, 172, 80, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      )
                    ],
                  )),
            ],
          ),
          const SizedBox(width: 5),
          Stack(
            children: [
              Image.asset('assets/png/cny.png', width: widget.size.width * 0.3),
              const Positioned(
                bottom: 15,
                left: 10,
                child:  Text(
                  'Activate Now',
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 145, 231, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListD {
  final String header;
  final List<Transaction> transactionList;

  ListD(this.header, this.transactionList);
}

class Transaction {
  final String text;
  final String currency;
  final String amount1;
  final String amount2;
  final bool isDebut;
  final TransactionDetailRequest transactionDetailRequest;

  Transaction(this.text, this.currency, this.amount1, this.amount2,
      this.isDebut, this.transactionDetailRequest);
}

class ShimmerLoading extends StatefulWidget {
  ShimmerLoading({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;
  final _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  _ShimmerLoadingState createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return widget._shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}
