import 'package:injectable/injectable.dart';

import '../../../../core/data/error/error_handler.dart';
import '../../../../core/data/remote/remote_data_source.dart';

abstract class {{featureName.pascalCase()}}Repository {}

/// use [wrapHandlingException] from [HandlingException] to handle any exceptions that may occur during authentication.
@LazySingleton(as: {{featureName.pascalCase()}}Repository)
class {{featureName.pascalCase()}}RepositoryImpl with HandlingException implements {{featureName.pascalCase()}}Repository {
  final RemoteDataSource remoteDataSource;
  const {{featureName.pascalCase()}}RepositoryImpl(this.remoteDataSource);
}