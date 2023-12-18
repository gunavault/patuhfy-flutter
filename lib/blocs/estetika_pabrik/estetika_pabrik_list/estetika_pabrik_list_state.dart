part of 'estetika_pabrik_list_cubit.dart';

@immutable
abstract class EstetikaPabrikListState {}

class LoadingEstetikaPabrikListState extends EstetikaPabrikListState {}

class SuccessEstetikaPabrikListState extends EstetikaPabrikListState {
  final List<EstetikaPabrikFormModel> data;
  SuccessEstetikaPabrikListState(this.data);
}
