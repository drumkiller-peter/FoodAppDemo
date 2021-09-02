import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intern_project/network/app_Exception.dart';

class NetworkBase {
  final String _baseUrl = "http://10.0.2.2:3000/";

  Future<dynamic> get(
    String endPoint,
  ) async {
    var _responseJson;
    print(Uri.parse(_baseUrl + endPoint));
    final _response = await http.get(Uri.parse(_baseUrl + endPoint));

    _responseJson = _returnResponse(_response);

    return _responseJson;
  }

  Future<Map<String, dynamic>> post(
    String endPoint,
    Map body,
  ) async {
    print('Api Post, url $endPoint');
    var _responseJson;

    final _response = await http.post(
      Uri.parse(_baseUrl + endPoint),
      body: json.encode(body),
    );
    _responseJson = _returnResponse(_response);

    return _responseJson;
  }

  Future<dynamic> put(
    String endPoint,
    dynamic body,
  ) async {
    print('Api Put, url $endPoint');
    var _responseJson;
    print(json.encode(body));
    print(Uri.parse(_baseUrl + endPoint));
    final _response = await http.put(
      Uri.parse(_baseUrl + endPoint),
      body: json.encode(body),
    );
    _responseJson = _returnResponse(_response);

    return _responseJson;
  }

  Future<dynamic> delete(
    String endPoint,
    dynamic body,
  ) async {
    print('Api delete, url $endPoint');
    var apiResponse;

    final _response = await http.delete(
      Uri.parse(_baseUrl + endPoint),
      body: json.encode(body),
    );

    apiResponse = _returnResponse(_response);

    return apiResponse;
  }

  jsonEncode(Map body) {}
}

dynamic _returnResponse(http.Response _response) {
  switch (_response.statusCode) {
    case 200:
      var _responseJson = json.decode(_response.body);
      return _responseJson;
    case 201:
      var _responseJson = json.decode(_response.body);
      return _responseJson;

    case 202:
      var _responseJson = json.decode(_response.body);
      return _responseJson;

    case 404:
      return Get.snackbar("Error", "page not found");

    default:
      return FetchDataException(
          'Error occured with StatusCode : ${_response.statusCode.toString()}');
  }
}
