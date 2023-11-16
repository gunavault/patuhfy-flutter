import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

part 'check_update_app_state.dart';

class CheckUpdateAppCubit extends Cubit<CheckUpdateAppState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  CheckUpdateAppCubit(this.localDataSource, this.remoteDataSource)
      : super(CheckUpdateAppInitial());

  final _shorebirdCodePush = ShorebirdCodePush();

  updatingApp() async {
    emit(UpdatingAppLoading());
    await Future.wait([
      _shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);

    emit(UpdatingAppSuccess());
  }
}
