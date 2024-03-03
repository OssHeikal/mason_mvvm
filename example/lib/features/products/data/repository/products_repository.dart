import 'package:injectable/injectable.dart';

import '../../../../core/data/error/error_handler.dart';
import '../../../../core/data/remote/remote_data_source.dart';

abstract class ProductsRepository {}

/// use [wrapHandlingException] from [HandlingException] to handle any exceptions that may occur during authentication.
@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl with HandlingException implements ProductsRepository {
  final RemoteDataSource remoteDataSource;
  const ProductsRepositoryImpl(this.remoteDataSource);
}