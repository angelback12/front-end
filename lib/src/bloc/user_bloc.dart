import 'package:licor/src/models/apiresponse_model.dart';
import 'package:licor/src/repository/repository.dart';

import '../models/apiresponse_model.dart';
import '../models/user_model.dart';
import '../repository/repository.dart';

class UserBloc {
  Repository repository = new Repository();

  Future<ApiResponse> insertUser(UserModel userModel) async {
    var apiResponse = await repository.insertUser(userModel);
    return apiResponse;
  }

  Future<List<UserModel>> getUser() {
    return repository.getUser();
  }
}
