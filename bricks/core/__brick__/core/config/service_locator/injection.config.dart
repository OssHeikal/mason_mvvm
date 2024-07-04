// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../../../features/shared/data/repository/shared_repository.dart'
    as _i12;
import '../../../../features/shared/presentation/controller/connectivity_cubit/connectivity_cubit.dart'
    as _i10;
import '../../data/client/api_client.dart' as _i8;
import '../../data/client/logger_interceptor.dart' as _i7;
import '../../data/local/local_data_source.dart' as _i9;
import '../../data/remote/remote_data_source.dart' as _i11;
import 'injection.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => registerModule.pref,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i5.FlutterSecureStorage>(
      () => registerModule.secureStorage);
  gh.lazySingleton<_i6.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i7.LoggerInterceptor>(() => _i7.LoggerInterceptor());
  gh.lazySingleton<_i8.ApiClient>(() => _i8.ApiClient(
        gh<_i4.Dio>(),
        loggingInterceptor: gh<_i7.LoggerInterceptor>(),
      ));
  gh.lazySingleton<_i9.LocalDataSource>(() => _i9.LocalDataSourceImpl(
        gh<_i3.SharedPreferences>(),
        gh<_i5.FlutterSecureStorage>(),
      ));
  gh.factory<_i10.ConnectivityCubit>(
      () => _i10.ConnectivityCubit(connectivity: gh<_i6.Connectivity>()));
  gh.lazySingleton<_i11.RemoteDataSource>(
      () => _i11.RemoteDataSourceImpl(gh<_i8.ApiClient>()));
  gh.lazySingleton<_i12.SharedRepository>(
      () => _i12.SharedRepositoryImpl(gh<_i11.RemoteDataSource>()));
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}
