import 'dart:convert';
import 'dart:io';
import 'package:arafaat_task_ropstam/data/exception_handling.dart';
import 'package:arafaat_task_ropstam/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BaseApiService{
  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;
  try{
    final response = await http.get(Uri.parse(url));
    responseJson = returnResponse(response);
  }on SocketException{
    throw FetchDataException('internet not connected');
  }
  return responseJson;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url),
        body: data
      );
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('internet not connected');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException("Error occurred while communicating with server with statusCode ${response.statusCode}");
    }
  }
}