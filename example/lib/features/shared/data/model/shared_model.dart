import 'package:equatable/equatable.dart';

class SharedModel extends Equatable {

  final int id;
  final String name;

  const SharedModel({required this.id, required this.name});

  factory SharedModel.fromJson(Map<String, dynamic> json) => SharedModel(id: json["id"], name: json['name']);



  @override
  List<Object> get props => [id,name];
}
