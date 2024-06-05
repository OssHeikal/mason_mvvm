import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'shared_state.dart';

class SharedCubit extends Cubit<SharedState> {
  SharedCubit() : super(const SharedState());
}
