import 'dart:convert';

List<UserModel> UserModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String albumsToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final String name;
  final String email;
  final String password;
  final int phone;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
        name: parsedJson['name'],
        email: parsedJson['email'],
        password: parsedJson['password'],
        phone: parsedJson['phone']);
  }

  factory UserModel.fromJsonMap(Map parsedJson) {
    return UserModel(
        name: parsedJson['name'],
        email: parsedJson['email'],
        password: parsedJson['password'],
        phone: parsedJson['phone']);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'password': password, 'phone': phone};

  Map<String, dynamic> toRegistry() =>
      {'name': name, 'email': email, 'password': password, 'phone': phone};
}
