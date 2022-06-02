import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/apiresponse_model.dart';
import '../models/error_api_response_model.dart';
import '../models/libro_model.dart';
import '../models/user_model.dart';

class LibroService {
  Future<ApiResponse> insertLibro(LibroModel libroModel) async {
    var body = json.encode(libroModel.toRegistry());
    var apiResponse = ApiResponse(menssage: '', object: '', statusResponse: 0);

    String baseUrl = 'http://192.168.10.27:8081';
    var res = await http.post('$baseUrl/api/biblioteca/libro/crearLibro',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: body);
    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 0) {
      var _libroModel = LibroModel.fromJson(resBody);
    } else {
      var _error = ErrorApiResponse.fromJson(resBody);
    }
    return apiResponse;
  }

  @override
  Future<List<LibroModel>> getLibro() async {
    String baseUrl = 'http://192.168.10.27:8081';
    final List collection;

    var response = await http.get('$baseUrl/api/biblioteca/libro/listarLibros');
    if (response.statusCode == 200) {
      collection = json.decode(response.body);

      return collection.map((data) => new LibroModel.fromJson(data)).toList();
    } else {
      throw Exception();
    }
  }
}
