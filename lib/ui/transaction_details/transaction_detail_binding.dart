import 'package:flutterprojectsetup/ui/transaction_details/transaction_detail_controller.dart';
import 'package:get/get.dart';

class TransactionDetailBinding extends Bindings {
  @override
  void dependencies() {
  Get.put(TransactionDetailController());
  }

}