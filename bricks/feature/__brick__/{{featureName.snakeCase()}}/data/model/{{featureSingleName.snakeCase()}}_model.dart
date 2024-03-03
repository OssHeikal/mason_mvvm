import 'package:equatable/equatable.dart';

class {{featureSingleName.pascalCase()}}Model extends Equatable {

  final int id;
  final String name;

  const {{featureSingleName.pascalCase()}}Model({required this.id, required this.name});

  factory {{featureSingleName.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => {{featureName.pascalCase()}}Model(id: json["id"], name: json['name']);



  @override
  List<Object> get props => [id,name];
}
