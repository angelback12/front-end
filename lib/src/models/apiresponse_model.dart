class ApiResponse{
  int statusResponse;
  String menssage;
  Object object;
  ApiResponse({
    required this.menssage,
    required  this.object,
     required this.statusResponse
  });
  factory ApiResponse.fromJson(Map<String,dynamic> json){
    return ApiResponse(
      statusResponse: json['statusResponse'],
      object: json['object '],
      menssage:json['object ']);
      }

  Map<String,dynamic> toJson()=>{
    'statusResponse':statusResponse,
        'object':object,

  };

}