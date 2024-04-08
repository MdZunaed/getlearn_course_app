import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../models/response_data.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(String url) async {
    log(url);
    final Response response = await get(Uri.parse(url), headers: {'Content-type': 'application/json'});
    log(response.statusCode.toString());
    log(response.headers.toString());
    log(response.body.toString());
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      return ResponseData(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: response.body,
      );
    }
  }
}
