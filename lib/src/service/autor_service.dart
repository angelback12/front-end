import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/apiresponse_model.dart';
import '../models/error_api_response_model.dart';
import '../models/autor_model.dart';

class AutorService {
  Future<ApiResponse> insertAutor(AutorModel autorModel) async {
    var body = json.encode(autorModel.toRegistry());
    var apiResponse = ApiResponse(menssage: '', object: '', statusResponse: 0);

    String baseUrl = 'http://192.168.0.7:8081';
    var res = await http.post('$baseUrl/api/biblioteca/autor/crearAutor',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: body);
    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 0) {
      var _autorModel = AutorModel.fromJson(resBody);
    } else {
      var _error = ErrorApiResponse.fromJson(resBody);
    }
    return apiResponse;
  }

  @override
  Future<List<AutorModel>> getAutor() async {
    String baseUrl = 'http://192.168.0.7:8081';
    final List collection;

    var response =
        await http.get('$baseUrl/api/biblioteca/autor/listarAutores');
    if (response.statusCode == 200) {
      collection = json.decode(response.body);

      return collection.map((data) => new AutorModel.fromJson(data)).toList();
    } else {
      throw Exception();
    }
  }
}
