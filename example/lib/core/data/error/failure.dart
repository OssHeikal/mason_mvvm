import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({required this.message, this.statusCode = -1});

  @override
  List<Object> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

class UnauthenticatedFailure extends Failure {
  const UnauthenticatedFailure({required super.message});
}

class UserNotAllowedFailure extends Failure {
  const UserNotAllowedFailure({required super.message});
}

class UserBlockedFailure extends Failure {
  const UserBlockedFailure({required super.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}
