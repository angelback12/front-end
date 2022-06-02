import 'package:licor/src/models/apiresponse_model.dart';
import '../models/apiresponse_model.dart';
import '../models/libro_model.dart';
import '../models/user_model.dart';
import '../service/libro_service.dart';
import '../service/user_service.dart';
import '../models/autor_model.dart';
import '../service/autor_service.dart';

class Repository {
  final userService = new UserService();
  final libroService = new LibroService();
  final autorService = new AutorService();

  Future<ApiResponse> insertUser(UserModel userModel) =>
      userService.insertUser(userModel);

  Future<ApiResponse> insertLibro(LibroModel libroModel) =>
      libroService.insertLibro(libroModel);

  Future<List<UserModel>> getUser() {
    return userService.getUser();
  }

  Future<List<LibroModel>> getLibro() {
    return libroService.getLibro();
  }

  Future<ApiResponse> insertAutor(AutorModel autorModel) =>
      autorService.insertAutor(autorModel);

  Future<List<AutorModel>> getAutor() {
    return autorService.getAutor();
  }
}
