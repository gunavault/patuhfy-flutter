import 'package:floor/floor.dart';

@Entity(tableName: "m_mandor")
class MandorModel {
  @PrimaryKey()
  String? nikSap;
  String? namaMandor;
  String? kodeAfd;

  MandorModel({this.nikSap, this.namaMandor, this.kodeAfd});

  MandorModel.fromJson(Map<String, dynamic> json) {
    print('apakah di exe juga nih mandor? ${json}');
    this.nikSap = json["nik_sap"];
    this.namaMandor = json["nama"];
    this.kodeAfd = json["afdeling"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nikSap"] = nikSap;
    data["namaMandor"] = namaMandor;
    data["kodeAfd"] = kodeAfd;

    return data;
  }

  @override
  String toString() => nikSap.toString();
}

class MandorModelResponse {
  List<MandorModel>? mandorModel;
  String? message;

  MandorModelResponse({this.mandorModel, this.message});
}
