import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/connection_util.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  ConnectivityCubit(this.localDataSource, this.remoteDataSource)
      : super(ConnectivityInitial());

  bool hasInterNetConnection = false;
  initConnectivity() async {
    try {
      ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
      //Initialize
      connectionStatus.initialize();
      //Listen for connection change
      connectionStatus.connectionChange.listen((dynamic hasConnection) {
        print('hasConnection $hasConnection');
        emit(HasConnection(hasConnection));
      });
    } catch (err) {}
  }

  getStatus() {
    return hasInterNetConnection;
  }

  void connectionChanged(dynamic hasConnection) {
    hasInterNetConnection = hasConnection;
  }
}
