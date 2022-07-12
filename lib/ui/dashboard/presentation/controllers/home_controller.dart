import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/di/api_provider.dart';
import 'package:flutterprojectsetup/ui/dashboard/presentation/views/drawer_home.dart';
import 'package:flutterprojectsetup/ui/data/data_provider.dart';
import 'package:flutterprojectsetup/ui/data/transaction_model.dart';
import 'package:flutterprojectsetup/ui/global_controller.dart';
import 'package:get/get.dart';

import '../../domain/adapters/repository_adapter.dart';

class DashboardController extends SuperController with GetTickerProviderStateMixin{

  // TabController? tabController;
  // final DataProvider? dataProvider;
  final IDashboardRepository? dashboardRepository;

  DashboardController( this.dashboardRepository);


  @override
  void onInit() async {
    List<TransactionList>? transactionList = await dashboardRepository?.getTransaction();
    print(transactionList);
    list = transactionList!;
    super.onInit();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
