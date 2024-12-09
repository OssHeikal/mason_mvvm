import 'package:injectable/injectable.dart';

import '../../../../core/data/remote/remote_data_source.dart';

abstract class {{featureName.pascalCase()}}Repository {}

@LazySingleton(as: {{featureName.pascalCase()}}Repository)
class {{featureName.pascalCase()}}RepositoryImpl implements {{featureName.pascalCase()}}Repository {
  final RemoteDataSource remoteDataSource;
  const {{featureName.pascalCase()}}RepositoryImpl(this.remoteDataSource);
}