import 'package:licor/src/models/apiresponse_model.dart';
import 'package:licor/src/repository/repository.dart';

import '../models/apiresponse_model.dart';
import '../models/libro_model.dart';
import '../models/user_model.dart';
import '../repository/repository.dart';

class LibroBloc {
  Repository repository = new Repository();

  Future<ApiResponse> insertLibro(LibroModel libroModel) async {
    var apiResponse = await repository.insertLibro(libroModel);
    return apiResponse;
  }

  Future<List<LibroModel>> getLibro() {
    return repository.getLibro();
  }
}
