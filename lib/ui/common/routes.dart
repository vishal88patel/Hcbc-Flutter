import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/ui/account_selection.dart';
import 'package:flutterprojectsetup/ui/dashboard/bindings/dashboard_binding.dart';
import 'package:flutterprojectsetup/ui/dashboard/presentation/views/drawer_home.dart';
import 'package:flutterprojectsetup/ui/dashboard/presentation/views/profile_view.dart';
import 'package:flutterprojectsetup/ui/integration_deposit/intergration_deposite.dart';
import 'package:flutterprojectsetup/ui/login/login_temp.dart';
import 'package:flutterprojectsetup/ui/transaction_details/transaction_detail_binding.dart';
import 'package:flutterprojectsetup/ui/transaction_details/transaction_detail_view.dart';
import 'package:get/get.dart';

import '../before_after_amount.dart';
import '../transfer_confirm.dart';
import '../transfer_confirmSlider.dart';



class RouteName {
  static const init = root;

  // Base routes
  static const String root = '/';
  static const String profilePage = '/profile';
  static const String dashboard = '/dashboard';
  static const String transactionHistory = '/transaction_history';
  static const String integrationDeposit = '/integration_deposit';
  static const String account = '/account';
  static const String account2 = '/account2';
  static const String account3 = '/account3';
  static const String slider = '/slider';
}

class Routes {
  static final routes = [
    GetPage(
        page: () =>  DrawerTemp(),
        name: RouteName.dashboard,
      binding: DashboardBinding()
        ),
    GetPage(
      page: () => const TransactionDetailView(),
      name: RouteName.transactionHistory,
      binding: TransactionDetailBinding(),
    ),
    GetPage(
      page: () => const LoginPage(),
      name: RouteName.root,
    ),
    GetPage(
      page: () => const IntegrationDepositePage(),
      name: RouteName.integrationDeposit,
    ),
    GetPage(
      page: () => const AccountSelection(),
      name: RouteName.account,
    ),
    GetPage(
      page: () => const BeforeAmount(),
      name: RouteName.account2,
    ),
    GetPage(
      page: () => const TransferConfirm(),
      name: RouteName.account3,
    ),
    GetPage(
      page: () => TransferConfirmSlider (),
      name: RouteName.slider,
    ),

  ];
  static final commonRoutes = <String, WidgetBuilder>{};
}
