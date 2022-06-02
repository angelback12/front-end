import 'package:licor/src/models/apiresponse_model.dart';
import 'package:licor/src/repository/repository.dart';

import '../models/apiresponse_model.dart';
import '../models/autor_model.dart';
import '../repository/repository.dart';

class AutorBloc {
  Repository repository = new Repository();

  Future<ApiResponse> insertAutor(AutorModel autorModel) async {
    var apiResponse = await repository.insertAutor(autorModel);
    return apiResponse;
  }

  Future<List<AutorModel>> getAutor() {
    return repository.getAutor();
  }
}
