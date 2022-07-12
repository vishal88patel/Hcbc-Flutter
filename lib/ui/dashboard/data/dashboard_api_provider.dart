import 'dart:io';

import 'package:flutterprojectsetup/di/api_provider.dart';
import 'package:flutterprojectsetup/models/post.dart';
import 'package:flutterprojectsetup/ui/common/api_client.dart';
import 'package:flutterprojectsetup/ui/data/transaction_model.dart';
import 'package:get/get.dart';

abstract class IDashboardProvider {
  // Future<Response<List<Post>>> getPosts(String path);
  Future<Response<List<TransactionList>>> getTransaction();

  // // TODO Example of image upload
  // Future<Response<Object>> uploadFile(String path, File file);
}

class DashboardProvider extends ApiProvider implements IDashboardProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiClient.baseUrl;
  }


  @override
  Future<Response<List<TransactionList>>> getTransaction() =>
      get<List<TransactionList>>('j2khalj2qdea0', decoder: (val) =>  ApiClient.convertMapToObject<TransactionList>(val));

  // @override
  // Future<Response<List<Post>>> getPosts(String path) =>
  //     get<List<Post>>(path, decoder: (val) => ApiClient.convertMapToObject<Post>(val));
  //
  // @override
  // Future<Response<Object>> uploadFile(String path, File file) {
  //   final form = FormData({
  //     'file': MultipartFile(file, filename: 'avatar.png'),
  //   });
  //   return post(path, form);
  // }
}
