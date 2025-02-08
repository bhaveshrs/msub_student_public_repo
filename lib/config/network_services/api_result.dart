import 'package:msub/config/network_services/api_result_service.dart';

abstract class ApiResult<T> extends Result<T> {
  const ApiResult._() : super.empty();
  const factory ApiResult.success({T data, String? message}) = ApiSuccess<T>;
  const factory ApiResult.failure({required dynamic errorMsg, T? errors}) =
      ApiFailure<T>;
}

class ApiSuccess<T> extends ApiResult<T> {
  final T? data;
  final String? message;
  const ApiSuccess({this.data, this.message}) : super._();
}

class ApiFailure<T> extends ApiResult<T> {
  final dynamic errorMsg;
  final T? errors;
  const ApiFailure({required this.errorMsg, this.errors}) : super._();
}

Future<ApiResult> commonApiCall(Future<ApiResult<dynamic>> apiCall) async {
  try {
    return await apiCall;
  } catch (e) {
    print(e);
    return ApiResult.failure(errorMsg: Exception('Something went wrong'));
  }
}
