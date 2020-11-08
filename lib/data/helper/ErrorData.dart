
class ErrorData {
  final String status;
  final String message;

  ErrorData({this.status = "fail", this.message});

  factory ErrorData.fromJson(Map<String , dynamic> json){
    return ErrorData(status: json['status'], message: json['message']);
  }
}