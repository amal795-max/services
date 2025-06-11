import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  // MyServices myServices=Get.find();
  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler){
    // final token = myServices.getData(key: ApiKeys.token);
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    super.onRequest(options, handler);
  }













}
