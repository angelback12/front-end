import 'dart:convert';

List<AutorModel> AutorModelFromJson(String str) =>
    List<AutorModel>.from(json.decode(str).map((x) => AutorModel.fromJson(x)));

String albumsToJson(List<AutorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AutorModel {
  final String name;
  final String nation;
  final int numlib;

  AutorModel({required this.name, required this.nation, required this.numlib});

  factory AutorModel.fromJson(Map<String, dynamic> parsedJson) {
    return AutorModel(
        name: parsedJson['name'],
        nation: parsedJson['nation'],
        numlib: parsedJson['numlib']);
  }

  factory AutorModel.fromJsonMap(Map parsedJson) {
    return AutorModel(
        name: parsedJson['name'],
        nation: parsedJson['nation'],
        numlib: parsedJson['numlib']);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'nation': nation, 'numlib': numlib};

  Map<String, dynamic> toRegistry() =>
      {'name': name, 'description': nation, 'numlib': numlib};
}
