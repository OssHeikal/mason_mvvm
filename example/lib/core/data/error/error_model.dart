import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final bool success;
  const ErrorMessageModel({required this.statusMessage, required this.success});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    String error = "";
    if (json["errors"] is Map) {
      for (var item in (json["errors"] as Map<String, dynamic>).entries) {
        error = "${error.isEmpty ? "" : "$error \n"} ${item.value}";
      }
    } else {
      error = json["message"].toString();
    }
    return ErrorMessageModel(
      statusMessage: error,
      success: json["success"],
    );
  }

  @override
  List<Object?> get props => [statusMessage, success];
}
