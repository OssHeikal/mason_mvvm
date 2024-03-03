// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:easy_localization/easy_localization.dart';

import 'failure.dart';
class ErrorConstants {
  ErrorConstants._();
  // error handler
  static String success = "dio_messages.success";
  static String badRequestError = "dio_messages.bad_request_error";
  static String noContent = "dio_messages.no_content";
  static String forbiddenError = "dio_messages.forbidden_error";
  static String unauthorizedError = "dio_messages.unauthorized_error";
  static String notFoundError = "dio_messages.not_found_error";
  static String conflictError = "dio_messages.conflict_error";
  static String blockedError = "dio_messages.blocked_error";
  static String internalServerError = "dio_messages.internal_server_error";
  static String notAllowed = "dio_messages.internal_server_error";

  static String unknownError = "dio_messages.unknown_error";
  static String timeoutError = "dio_messages.timeout_error";
  static String defaultError = "dio_messages.default_error";
  static String cacheError = "dio_messages.cache_error";
  static String noInternetError = "dio_messages.no_internet_error";
}

class ResponseMessage {
  static String SUCCESS = ErrorConstants.success;
  static String NO_CONTENT = ErrorConstants.success;
  static String BAD_REQUEST = ErrorConstants.badRequestError;
  static String UNAUTHORIZED = ErrorConstants.unauthorizedError;
  static String FORBIDDEN = ErrorConstants.forbiddenError;
  static String INTERNAL_SERVER_ERROR = ErrorConstants.internalServerError;
  static String NOT_FOUND = ErrorConstants.notFoundError;

  // local status code
  static String CONNECT_TIMEOUT = ErrorConstants.timeoutError;
  static String CANCEL = ErrorConstants.defaultError;
  static String RECEIVE_TIMEOUT = ErrorConstants.timeoutError;
  static String SEND_TIMEOUT = ErrorConstants.timeoutError;
  static String CACHE_ERROR = ErrorConstants.cacheError;
  static String NO_INTERNET_CONNECTION = ErrorConstants.noInternetError;
  static String DEFAULT = ErrorConstants.defaultError;
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // ServerFailure, API rejected request
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int NOT_ALLOWED = 405; // failure, not allowed
  static const int BLOCKED = 420; // failure,blocked
  static const int Bad_Content = 422; // failure, Bad_Content
  static const int BAD_REQUEST_Server = 402; // ServerFailure, API rejected request

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

enum ResponseStatusType {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension ResponseStatusTypeExtension on ResponseStatusType {
  Failure getFailure() {
    switch (this) {
      case ResponseStatusType.SUCCESS:
        return ServerFailure(statusCode: ResponseCode.SUCCESS, message: ResponseMessage.SUCCESS.tr());
      case ResponseStatusType.NO_CONTENT:
        return ServerFailure(statusCode: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT.tr());
      case ResponseStatusType.BAD_REQUEST:
        return ServerFailure(statusCode: ResponseCode.BAD_REQUEST, message: ResponseMessage.BAD_REQUEST.tr());
      case ResponseStatusType.FORBIDDEN:
        return ServerFailure(statusCode: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN.tr());
      case ResponseStatusType.UNAUTHORIZED:
        return ServerFailure(statusCode: ResponseCode.UNAUTHORIZED, message: ResponseMessage.UNAUTHORIZED.tr());
      case ResponseStatusType.NOT_FOUND:
        return ServerFailure(statusCode: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND.tr());
      case ResponseStatusType.INTERNAL_SERVER_ERROR:
        return ServerFailure(
          statusCode: ResponseCode.INTERNAL_SERVER_ERROR,
          message: ResponseMessage.INTERNAL_SERVER_ERROR.tr(),
        );
      case ResponseStatusType.CONNECT_TIMEOUT:
        return ServerFailure(statusCode: ResponseCode.CONNECT_TIMEOUT, message: ResponseMessage.CONNECT_TIMEOUT.tr());
      case ResponseStatusType.CANCEL:
        return ServerFailure(statusCode: ResponseCode.CANCEL, message: ResponseMessage.CANCEL.tr());
      case ResponseStatusType.RECEIVE_TIMEOUT:
        return ServerFailure(statusCode: ResponseCode.RECEIVE_TIMEOUT, message: ResponseMessage.RECEIVE_TIMEOUT.tr());
      case ResponseStatusType.SEND_TIMEOUT:
        return ServerFailure(statusCode: ResponseCode.SEND_TIMEOUT, message: ResponseMessage.SEND_TIMEOUT.tr());
      case ResponseStatusType.CACHE_ERROR:
        return ServerFailure(statusCode: ResponseCode.CACHE_ERROR, message: ResponseMessage.CACHE_ERROR.tr());
      case ResponseStatusType.NO_INTERNET_CONNECTION:
        return ServerFailure(
          statusCode: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION.tr(),
        );
      case ResponseStatusType.DEFAULT:
        return ServerFailure(statusCode: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT.tr());
    }
  }
}
