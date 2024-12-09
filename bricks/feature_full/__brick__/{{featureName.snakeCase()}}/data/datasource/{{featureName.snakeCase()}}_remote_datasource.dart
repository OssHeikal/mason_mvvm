import 'package:injectable/injectable.dart';

import '../../../../../core/data/client/api_client.dart';

abstract class {{featureName.pascalCase()}}RemoteDataSource {}

@LazySingleton(as: {{featureName.pascalCase()}}RemoteDataSource)
class {{featureName.pascalCase()}}RemoteDataSourceImpl implements {{featureName.pascalCase()}}RemoteDataSource {
  final ApiClient client;
  const {{featureName.pascalCase()}}RemoteDataSourceImpl(this.client);
}