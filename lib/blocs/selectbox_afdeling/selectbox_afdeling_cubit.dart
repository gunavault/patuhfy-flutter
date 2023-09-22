import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';

part 'selectbox_afdeling_state.dart';

class SelectboxAfdelingCubit extends Cubit<SelectboxAfdelingState> {
  SelectboxAfdelingCubit(this.localDataSource) : super(LoadingState());

  final LocalDataSource localDataSource;

  setTypeUser(SelectboxAfdelingState SelectboxAfdelingState) {
    emit(SelectboxAfdelingState);
  }

  getData() async {
    emit(LoadingState());
    List<AfdelingModel> data;

    data = await localDataSource.getAllAfdeling();
    print('data apa nih11 ${data}');
    emit(SuccessState(data));
  }
}
