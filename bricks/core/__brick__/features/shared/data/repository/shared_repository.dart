import 'package:injectable/injectable.dart';

import '../../../../core/data/error/error_handler.dart';
import '../../../../core/data/remote/remote_data_source.dart';

abstract class SharedRepository {}

/// use [wrapHandlingException] from [HandlingException] to handle any exceptions that may occur during authentication.
@LazySingleton(as: SharedRepository)
class SharedRepositoryImpl with HandlingException implements SharedRepository {
  final RemoteDataSource remoteDataSource;
  const SharedRepositoryImpl(this.remoteDataSource);
}