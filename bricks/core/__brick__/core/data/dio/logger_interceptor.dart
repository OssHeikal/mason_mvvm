import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton()
class LoggerInterceptor extends Interceptor {
  final _logger =
      Logger(printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 75, colors: true, printEmojis: true, printTime: false));

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    _logger.e('${options.method} request => $requestPath');
    _logger.d('Error: ${err.error}, code: ${err.response?.statusCode} ,  data: ${err.response?.data} , '); // body: ${err.response?.data}
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    final query = options.queryParameters;
    final data = options.data;
    _logger.i("${options.method} request => $requestPath (Query:$query)  (Data:$data), header: ${options.headers}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
        'StatusCode: ${response.statusCode}, ( ${response.requestOptions.method} ${response.requestOptions.path}  ) ${response.statusCode != 200 ? response.data : ""}'); //${response.data}
    return super.onResponse(response, handler);
  }
}
