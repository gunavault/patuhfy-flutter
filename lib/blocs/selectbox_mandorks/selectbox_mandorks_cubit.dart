import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/mandor_model.dart';

part 'selectbox_mandorks_state.dart';

class SelectboxMandorCubit extends Cubit<SelectboxMandorState> {
  SelectboxMandorCubit(this.localDataSource) : super(InitialSbMandorState());

  final LocalDataSource localDataSource;

  Future<List<MandorModel>> getData() async {
    List<MandorModel> data;

    data = await localDataSource.getAllMandor();

    return data;
  }

  // getDataNew() async {
  //   List<AfdelingModel> data;
  //   data = await localDataSource.getAllAfdeling();
  //   print('data apa nih11 ${data}');

  //   return data;
  // }
}
