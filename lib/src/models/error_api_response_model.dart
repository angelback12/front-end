class ErrorApiResponse{
  int statusResponse;
  String menssage;
  Object object;
  ErrorApiResponse({
    required this.menssage,
    required  this.object,
     required this.statusResponse
  });
  factory ErrorApiResponse.fromJson(Map<String,dynamic> json){
    return ErrorApiResponse(
      statusResponse: json['statusResponse'],
      object: json['object '],
      menssage:json['object ']);
      }

  Map<String,dynamic> toJson()=>{
    'statusResponse':statusResponse,
        'object':object,

  };

}