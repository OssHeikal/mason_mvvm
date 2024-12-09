import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mutaafi/core/config/router/route_manager.dart';

import '../../resources/type_defs.dart';
import '../../utils/toaster_utils.dart';
import 'error_constants.dart';
import 'error_model.dart';
import 'failure.dart';

mixin HandlingException {
  /// Wraps the execution of a future with exception handling.
  ///
  /// This method takes a generic type `T` and returns a `Future` that
  /// either contains a `Failure` or a value of type `T`. It wraps the
  /// execution of the provided future with exception handling, ensuring
  /// that any exceptions thrown during the execution are caught and
  /// returned as a `Failure` object.
  ///
  /// Example usage:
  /// ```dart
  /// final result = await wrapHandlingException<Model>(
  ///  tryCall: () => // function that returns a future dynamic response, and may throw an exception,
  ///  jsonConvert: (json) => // convert json to the required <Model> or type
  /// );
  ///
  /// result.fold(
  ///   (failure) => print('An error occurred: ${failure.massage}'),
  ///   (value) => print('The result is: $value'),
  /// );
  /// ```
  DataResponse<T> wrapHandlingException<T>({
    required T Function(dynamic json) jsonConvert,
    required Future<Response<dynamic>> Function() tryCall,
  }) async {
    try {
      final result = await tryCall();
      if (result.statusCode == ResponseCode.SUCCESS || result.statusCode == ResponseCode.NO_CONTENT) {
        // on success
        debugPrint(result.data.toString());
        return Right(jsonConvert(result.data));
      } else {
        // on failure
        return Left(ResponseStatusType.BAD_REQUEST.getFailure());
      }
    } catch (e) {
      debugPrint(e.toString());
      // on error
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      print(error);
      failure = ServerFailure(message: error.toString(), statusCode: ResponseCode.BAD_REQUEST_Server);
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ResponseStatusType.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return ResponseStatusType.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return ResponseStatusType.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.UNAUTHORIZED:
            if (BaseRouter.routerConfig.canPop()) {
              BaseRouter.routerConfig.pop();
            }
            // BaseRouter.routerConfig.pushNamed(AppRoutes.login.name);
            Toaster.showToast(ErrorConstants.unauthorizedError.tr());
            return UnauthenticatedFailure(message: ErrorConstants.unauthorizedError);
          case ResponseCode.BLOCKED:
            return UserBlockedFailure(message: ErrorConstants.blockedError);
          case ResponseCode.NOT_ALLOWED:
            return UserNotAllowedFailure(message: ErrorConstants.notAllowed);
          case ResponseCode.Bad_Content:
            return ServerFailure(
              message: ErrorMessageModel.fromJson(error.response?.data).statusMessage,
              statusCode: ResponseCode.Bad_Content,
            );
          case ResponseCode.BAD_REQUEST_Server:
            return ServerFailure(
              message: ErrorMessageModel.fromJson(error.response?.data).statusMessage,
              statusCode: ResponseCode.BAD_REQUEST_Server,
            );
          case ResponseCode.BAD_REQUEST:
            return ServerFailure(
              message: ErrorMessageModel.fromJson(error.response?.data).statusMessage,
              statusCode: ResponseCode.BAD_REQUEST,
            );
          default:
            return ServerFailure(
              message: error.response?.data.toString() ?? '',
              statusCode: error.response?.statusCode ?? ResponseCode.BAD_REQUEST,
            );
        }
      case DioExceptionType.cancel:
        return ResponseStatusType.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return ResponseStatusType.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return ResponseStatusType.BAD_REQUEST.getFailure();
      case DioExceptionType.connectionError:
        return ResponseStatusType.NO_INTERNET_CONNECTION.getFailure();
    }
  }
}

extension DioExceptionExtension on Future<Response> {
  DataResponse<T> map<T>(FromJson<T> jsonConvert) async {
    try {
      final result = await this;
      if (result.statusCode == ResponseCode.SUCCESS || result.statusCode == ResponseCode.NO_CONTENT) {
        // on success
        debugPrint(result.data.toString());
        return Right(jsonConvert(result.data));
      } else {
        // on failure
        return Left(ResponseStatusType.BAD_REQUEST.getFailure());
      }
    } catch (e) {
      debugPrint(e.toString());
      // on error
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
