import 'package:floor/floor.dart';

@Entity(tableName: "m_afdeling")
class AfdelingModel {
  @primaryKey
  String? kodeAfd;

  AfdelingModel({this.kodeAfd});

  AfdelingModel.fromJson(Map<String, dynamic> json) {
    kodeAfd = json["afdeling"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["kodeAfd"] = kodeAfd;
    return data;
  }

  @override
  String toString() => kodeAfd.toString();
}

class AfdelingModelResponse {
  List<AfdelingModel>? afdelingModel;
  String? message;

  AfdelingModelResponse({this.afdelingModel, this.message});
}
