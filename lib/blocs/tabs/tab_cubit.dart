import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState.tasksheet);

  setTab(TabState TabState) {
    emit(TabState);
  }
}
