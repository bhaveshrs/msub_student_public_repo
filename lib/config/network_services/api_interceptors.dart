import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:msub/config/network_services/api_headers.dart';
import 'package:msub/config/network_services/api_result.dart';

class ApiInterceptors {
  getInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        Map<String, dynamic> headers = await ApiHeaders.getHeaders();
        headers.addAll(options.headers);
        options.headers = headers;
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        if (response.statusCode == 400 &&
            response.data['message'] == 'jwt expired') {
          return handler.next(response);
        }
        // else if (response.statusCode == 404) {
        //   response.data = ApiResult.failure(
        //       errorMsg: 'Process Failed', errors: response.data["errors"]);
        //   return handler.next(response);
        // }
        var data = response.data;
        if (response.data.runtimeType == String) {
          data = jsonDecode(data);
        }

        if (response.statusCode == 200 && data['status'] == "success") {
          response.data = ApiResult.success(
            data: (data as Map).containsKey('data') ? data['data'] : data,
            message: data['message'],
          );
        } else {
          response.data = ApiResult.failure(
              errorMsg: data['message'], errors: data['errors']);
        }

        return handler.next(response);
      },
      onError: (e, handler) async {
        if (e.response != null) {
          await handleSocketException();
        }
        e.response?.data = ApiResult.failure(errorMsg: Exception(e.toString()));
        return handler.next(e);
      },
    );
  }

  handleSessionTimeout(Response response) async {}

  handleSocketException() async {
    // if (NavigationService.navigatorKey.currentContext != null) {
    //   ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
    //       .showSnackBar(SnackBar(
    //     backgroundColor: null,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     behavior: SnackBarBehavior.floating,
    //     content: const Text(
    //       'Please check your internet connection',
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     duration: const Duration(seconds: 3),
    //   ));
    // }
    // TODO: Handle socket exception
    // return Response(
    //   {'message': 'Please check your internet connection'},
    //   statusCode: 502,
    //   requestOptions: RequestOptions(),
    // );
  }
}
