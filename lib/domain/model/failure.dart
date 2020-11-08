
class Failure {
  final String status;
  final String message;

  Failure({this.status = "fail", this.message});

  factory Failure.fromJson(Map<String , dynamic> json){
    return Failure(status: json['status'], message: json['message']);
  }
}