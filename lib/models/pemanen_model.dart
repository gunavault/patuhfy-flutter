import 'package:floor/floor.dart';

@Entity(tableName: "m_pemanen")
class PemanenModel {
  @PrimaryKey()
  String? nikSapPemanen;
  String? namaPemanen;
  String? nikSapMandor;

  PemanenModel({this.nikSapPemanen, this.namaPemanen, this.nikSapMandor});

  PemanenModel.fromJson(Map<String, dynamic> json) {
    nikSapPemanen = json["nik_pemanen"];
    namaPemanen = json["nama_pemanen"];
    nikSapMandor = json["nik_mandor"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nikSapPemanen"] = nikSapPemanen;
    data["namaPemanen"] = namaPemanen;
    data["nikSapMandor"] = nikSapMandor;

    return data;
  }

  @override
  String toString() => nikSapPemanen.toString();
  String userAsString() {
    return '$nikSapPemanen $namaPemanen';
  }
}

class PemanenModelResponse {
  List<PemanenModel> pemanenModel;
  String? message;

  PemanenModelResponse({required this.pemanenModel, this.message});
}
