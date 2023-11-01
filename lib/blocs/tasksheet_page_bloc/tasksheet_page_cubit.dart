import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/user_model.dart';

part 'tasksheet_page_state.dart';

class TasksheetPageCubit extends Cubit<TasksheetPageState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  final String selectedDate;

  TasksheetPageCubit(
      this.localDataSource, this.remoteDataSource, this.selectedDate)
      : super(SetTasksheetPageState(selectedDate, UserModel()));

  initTasksheetPage() async {
    UserModel userModel = await localDataSource.getCurrentUser();
    emit(SetTasksheetPageState(selectedDate, userModel));
  }

  setDatePage(String taskDate) async {
    UserModel userModel = await localDataSource.getCurrentUser();
    emit(SetTasksheetPageState(taskDate, userModel));
  }
}
