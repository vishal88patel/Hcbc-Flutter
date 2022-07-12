import 'package:flutterprojectsetup/ui/common/transaction_details_request.dart';
import 'package:get/get.dart';

class TransactionDetailController extends SuperController{
  TransactionDetailRequest? transactionDetailRequest;

  @override
  void onInit(){
    transactionDetailRequest = Get.arguments;
  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

}