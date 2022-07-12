import 'package:flutterprojectsetup/di/api_provider.dart';
import 'package:flutterprojectsetup/ui/common/api_client.dart';
import 'package:flutterprojectsetup/ui/data/transaction_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class IDataProvider {
  Future<Response<List<TransactionList>>> getTransaction();
}


class DataProvider extends ApiProvider implements IDataProvider{

  @override
  void onInit() {
    httpClient.baseUrl = ApiClient.baseUrl;
  }

  @override
  Future<Response<List<TransactionList>>> getTransaction() =>
      get<List<TransactionList>>('j2khalj2qdea0', decoder: (val) =>  ApiClient.convertMapToObject<TransactionList>(val));
}