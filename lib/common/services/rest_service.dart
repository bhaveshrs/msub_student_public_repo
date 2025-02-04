import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart' show BuildContext;
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../utils/async_task_helper.dart';
import '../utils/constants.dart';
import 'cache_service.dart';

class RestHelper {
  // static const _host = "https://wx-tech.in/iota/public/api/v1/";
  static const _host = "https://myfaculy-msub.in/api/v1/";
  static final Map<String, String> _cacheMap = {};

  RestHelper._();

  static Future<Map<String, dynamic>> deleteRequest(String url, BuildContext context,
      {Map<String, String>? body, bool showloading = true, bool authorization = false}) async {
    try {
      if (showloading) AsyncTaskHelper.showBusy(context);
      var headers = {
        "Content-Type": "application/json",
      };
      if (authorization) {
        var token = await CacheService.readCache(key: Constants.token);
        headers.addAll({"Authorization": "bearer $token"});
      }
      var response = await delete(Uri.parse(_host + url), headers: headers, body: body == null ? null : jsonEncode(body));
      if (showloading) AsyncTaskHelper.remove();
      log("Response for $url : ${response.body}", time: DateTime.now(), name: "REST");
      Map<String, dynamic> result = jsonDecode(response.body);
      if (response.statusCode >= 400 && response.statusCode < 500) {
        result.addIf(!result.containsKey("status"), "status", false);
      }
      return result;
    } on SocketException {
      if (showloading) AsyncTaskHelper.remove();
      return {"status": false, "message": "Please check your internet connection!"};
    } on Exception catch (e) {
      log("Exception : $e", time: DateTime.now(), name: "REST");
      return {"status": false, "message": "Exception: $e"};
    }
  }

  static Future<Map<String, dynamic>> getRequest(String url, BuildContext context,
      {bool showloading = true, bool useCache = false, bool authorization = false}) async {
    log("CALLING API FOR : $url", name: "REST-REQUEST");
    var start = DateTime.now();
    try {
      if (showloading) AsyncTaskHelper.showBusy(context);
      var headers = {
        "Content-Type": "application/json",
      };
      if (authorization) {
        var token = await CacheService.readCache(key: Constants.token);
        headers.addAll({"Authorization": "bearer $token"});
      }
      if (useCache && _cacheMap.containsKey(url)) {
        return jsonDecode(_cacheMap[url]!);
      }
      var response = await get(
        Uri.parse(_host + url),
        headers: headers,
      ).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          if (showloading) AsyncTaskHelper.remove();
          throw Exception("Timeout");
        },
      );
      if (showloading) AsyncTaskHelper.remove();
      var end = DateTime.now();
      log("Response fo $url in ${end.difference(start).inMicroseconds} :"
          " ${response.body}", time: DateTime.now(), name: "REST-RESPONSE");
      if (useCache && !_cacheMap.containsKey(url)) {
        _cacheMap[url] = response.body;
      }
      return jsonDecode(response.body);
    } on SocketException {
      if (showloading) AsyncTaskHelper.remove();
      return {"status": false, "message": "Please check your internet connection!"};
    } on Exception catch (e) {
      log("Exception : $e", time: DateTime.now(), name: "REST");
      return {"status": false, "message": "$e"};
    }
  }

  static Future<Map<String, dynamic>> postRequest(String url, Map<String, dynamic> body, BuildContext context,
      {bool showloading = true, bool authorization = false}) async {
    try {
      log("Request body for $url : $body", name: "REST");
      if (showloading) AsyncTaskHelper.showBusy(context);
      var headers = {
        "Content-Type": "application/json",
      };
      if (authorization) {
        var token = await CacheService.readCache(key: Constants.token);
        headers.addAll({"Authorization": "bearer $token"});
      }
      var response = await post(Uri.parse(_host + url), headers: headers, body: jsonEncode(body)).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          if (showloading) AsyncTaskHelper.remove();
          throw Exception("Timeout");
        },
      );
      if (showloading) AsyncTaskHelper.remove();
      log("Response for $url : ${response.body}", time: DateTime.now(), name: "REST");
      return jsonDecode(response.body);
    } on SocketException {
      if (showloading) AsyncTaskHelper.remove();
      return {"status": false, "message": "Please check your internet connection!"};
    } on Exception catch (e) {
      log("Exception : $e", time: DateTime.now(), name: "REST");
      return {"status": false, "message": "Exception: $e"};
    }
  }

  static Future<Map<String, dynamic>> putRequest(String url, Map<String, dynamic> body, BuildContext context,
      {bool showloading = true, bool authorization = false}) async {
    try {
      log("Request body for $url : $body", name: "REST");
      if (showloading) AsyncTaskHelper.showBusy(context);
      var headers = {
        "Content-Type": "application/json",
      };
      if (authorization) {
        var token = await CacheService.readCache(key: Constants.token);
        headers.addAll({"Authorization": "bearer $token"});
      }
      var response = await put(Uri.parse(_host + url), headers: headers, body: jsonEncode(body));
      if (showloading) AsyncTaskHelper.remove();
      log("Response for $url : ${response.body}", time: DateTime.now(), name: "REST");
      Map<String, dynamic> result = jsonDecode(response.body);
      if (response.statusCode >= 400 && response.statusCode < 500) {
        result.addIf(!result.containsKey("status"), "status", false);
      }
      return result;
    } on SocketException {
      if (showloading) AsyncTaskHelper.remove();
      return {"status": false, "message": "Please check your internet connection!"};
    } on Exception catch (e) {
      log("Exception : $e", time: DateTime.now(), name: "REST");
      return {"status": false, "message": "Exception: $e"};
    }
  }
}
