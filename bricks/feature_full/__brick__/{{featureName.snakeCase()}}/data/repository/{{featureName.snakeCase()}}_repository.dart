import 'package:injectable/injectable.dart';

import '../datasource/{{featureName.snakeCase()}}_remote_datasource.dart';

abstract class {{featureName.pascalCase()}}Repository {}

@LazySingleton(as: {{featureName.pascalCase()}}Repository)
class {{featureName.pascalCase()}}RepositoryImpl implements {{featureName.pascalCase()}}Repository {
  final {{featureName.pascalCase()}}RemoteDataSource remoteDataSource;
  const {{featureName.pascalCase()}}RepositoryImpl(this.remoteDataSource);
}