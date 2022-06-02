import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/apiresponse_model.dart';
import '../models/error_api_response_model.dart';
import '../models/user_model.dart';

class UserService {
  Future<ApiResponse> insertUser(UserModel userModel) async {
    var body = json.encode(userModel.toRegistry());
    var apiResponse = ApiResponse(menssage: '', object: '', statusResponse: 0);

    String baseUrl = 'http://192.168.1.57:8085';
    var res = await http.post('$baseUrl/api/licorApp/User/save',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: body);
    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 0) {
      var _userModel = UserModel.fromJson(resBody);
    } else {
      var _error = ErrorApiResponse.fromJson(resBody);
    }
    return apiResponse;
  }

  @override
  Future<List<UserModel>> getUser() async {
    String baseUrl = 'http://192.168.1.57:8085';
    final List collection;

    var response = await http.get('$baseUrl/api/licorApp/User/all');
    if (response.statusCode == 200) {
      collection = json.decode(response.body);

      return collection.map((data) => new UserModel.fromJson(data)).toList();
    } else {
      throw Exception();
    }
  }
}
