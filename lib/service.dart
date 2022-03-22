import 'package:dio/dio.dart';

class Service {
  factory Service() => _inst;
  static Service _inst = Service._inter();
  late Dio dio;

  Service._inter() {
    var options = BaseOptions(
      baseUrl: 'https://srv0api-v2-framy-stage.uc.app.playsee.co',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    var headers = {
      'authorization': '0123456789#0#examId',
    };
    options.headers = headers;
    dio = Dio(options);
  }
}




// or new Dio with a BaseOptions instance.

