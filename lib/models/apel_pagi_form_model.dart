import 'package:floor/floor.dart';

@Entity(tableName: "t_apel_pagi", primaryKeys: ['id'])
class ApelPagiFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? unitKerja;
  String? afd;
  String? foto;
  String? createdBy;
  String? long;
  String? lat;
  int? isSend;

  ApelPagiFormModel(
      {this.id,
      this.tanggal,
      this.unitKerja,
      required this.afd,
      required this.foto,
      this.createdBy,
      this.long,
      this.lat,
      this.isSend});

  ApelPagiFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    tanggal = json["TANGGAL"];
    unitKerja = json["UNIT_KERJA"];
    afd = json["AFDELING"];
    foto = json["FOTO"];
    createdBy = json["CREATED_BY"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    isSend = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["tanggal"] = tanggal;
    data["unitKerja"] = unitKerja;
    data["afd"] = afd;
    data["foto"] = foto;
    data["createdBy"] = createdBy;
    data["foto"] = foto;
    data["long"] = long;
    data["lat"] = lat;

    return data;
  }
}

class ApelPagiFormModelResponse {
  final int status_code;
  final String message;
  final ApelPagiFormModel? dataForm;

  ApelPagiFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class ApelPagiFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<ApelPagiFormModel> dataForm;

  ApelPagiFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
