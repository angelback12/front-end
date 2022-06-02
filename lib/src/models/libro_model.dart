import 'dart:convert';

List<LibroModel> LibroModelFromJson(String str) =>
    List<LibroModel>.from(json.decode(str).map((x) => LibroModel.fromJson(x)));

String albumsToJson(List<LibroModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LibroModel {
  final String name;
  final String description;

  LibroModel({required this.name, required this.description});

  factory LibroModel.fromJson(Map<String, dynamic> parsedJson) {
    return LibroModel(
      name: parsedJson['name'],
      description: parsedJson['description'],
    );
  }

  factory LibroModel.fromJsonMap(Map parsedJson) {
    return LibroModel(
        name: parsedJson['name'], description: parsedJson['description']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'description': description};

  Map<String, dynamic> toRegistry() =>
      {'name': name, 'description': description};
}
