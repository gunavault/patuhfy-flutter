part of 'tasksheet_page_cubit.dart';

@immutable
abstract class TasksheetPageState {}

class InitialTasksheetPageState extends TasksheetPageState {}

class SetTasksheetPageState extends TasksheetPageState {
  final String selectedDate;
  final UserModel userModel;

  SetTasksheetPageState(this.selectedDate, this.userModel);
}

// class SuccessTasksheetPageState extends TasksheetPageState {
//   final int status_code;
//   final String message;
//   SuccessTasksheetPageState({required this.status_code, required this.message});
// }

// class DuplicatedTasksheetPageState extends TasksheetPageState {
//   final int status_code;
//   final String message;
//   DuplicatedTasksheetPageState(
//       {required this.status_code, required this.message});
// }

// class ErrorTasksheetPageState extends TasksheetPageState {
//   final String? message;

//   ErrorTasksheetPageState(this.message);
// }
