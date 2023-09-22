import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'type_user_state.dart';

class TypeUserCubit extends Cubit<TypeUserState> {
  TypeUserCubit() : super(TypeUserInitial());

  setTypeUser(TypeUserState typeUserState) {
    emit(typeUserState);
  }
}
