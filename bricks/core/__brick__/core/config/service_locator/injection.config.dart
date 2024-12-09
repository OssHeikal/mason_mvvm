// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/shared/data/repository/shared_repository.dart'
    as _i655;
import '../../../features/shared/presentation/controller/connectivity_cubit/connectivity_cubit.dart'
    as _i496;
import '../../data/client/api_client.dart' as _i897;
import '../../data/client/logger_interceptor.dart' as _i891;
import '../../data/local/local_data_source.dart' as _i18;
import '../../data/remote/remote_data_source.dart' as _i803;
import 'injection.dart' as _i464;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.pref,
    preResolve: true,
  );
  gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage);
  gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i891.LoggerInterceptor>(() => _i891.LoggerInterceptor());
  gh.lazySingleton<_i897.ApiClient>(() => _i897.ApiClient(
        gh<_i361.Dio>(),
        loggingInterceptor: gh<_i891.LoggerInterceptor>(),
      ));
  gh.lazySingleton<_i18.LocalDataSource>(() => _i18.LocalDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ));
  gh.factory<_i496.ConnectivityCubit>(
      () => _i496.ConnectivityCubit(connectivity: gh<_i895.Connectivity>()));
  gh.lazySingleton<_i803.RemoteDataSource>(
      () => _i803.RemoteDataSourceImpl(gh<_i897.ApiClient>()));
  gh.lazySingleton<_i655.SharedRepository>(
      () => _i655.SharedRepositoryImpl(gh<_i803.RemoteDataSource>()));
  return getIt;
}

class _$RegisterModule extends _i464.RegisterModule {}
