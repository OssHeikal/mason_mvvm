part of 'connectivity_cubit.dart';

class ConnectivityState extends Equatable {
  const ConnectivityState({this.status = ConnectivityStatus.checking});

  final ConnectivityStatus status;

  ConnectivityState copyWith({
    ConnectivityStatus? status,
  }) {
    return ConnectivityState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
