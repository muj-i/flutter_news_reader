import 'dart:convert';
import 'dart:developer';

import 'package:flutter_news_reader/data/models/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  //get request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(
        Uri.parse(url),
       
      );
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          decodedResponse['status'] == 'ok') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      }  else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log('Error occurred during GET request: $e');
    }
    return const NetworkResponse(false, -1, null);
  }
}
