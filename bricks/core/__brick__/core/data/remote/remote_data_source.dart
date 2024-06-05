import '../../resources/type_defs.dart';
import '../client/api_client.dart';
import 'package:injectable/injectable.dart';

/// Add your remote data source methods here
///
/// - [ParamsMap] is a type def for Map<String, String?>?
/// - [BodyMap] is a type def for Map<String, dynamic>
///
/// Example:
/// ```dart
/// Future<Response> login(BodyMap body);
/// Future<Response> getCities(ParamsMap);
/// ```
abstract class RemoteDataSource {}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient dio;

  RemoteDataSourceImpl(this.dio);
}
