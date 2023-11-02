import 'package:floor/floor.dart';

@Entity(tableName: "t_lap_kerusakan", primaryKeys: ['id'])
class LapKerusakanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  // String? company;
  String? unitKerja;
  String? afd;
  String? foto;
  String? createdBy;
  String? long;
  String? lat;
  String? keterangan;
  String? rencana_tindaklanjut;
  int? isSend;

  LapKerusakanFormModel(
      {this.id,
      this.tanggal,
      // this.company,
      this.unitKerja,
      this.afd,
      this.foto,
      this.createdBy,
      this.long,
      this.lat,
      this.keterangan,
      this.rencana_tindaklanjut,
      this.isSend});

  LapKerusakanFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    tanggal = json["TANGGAL"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    afd = json["AFDELING"];
    foto = json["FOTO"];
    createdBy = json["CREATED_BY"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    keterangan = json["KETERANGAN"];
    rencana_tindaklanjut = json["RENCANA_TINDAKLANJUT"];
    isSend = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    // data["COMPANY"] = company;
    data["UNITKERJA"] = unitKerja;
    data["AFD"] = afd;
    data["FOTO"] = foto;
    data["CREATEDBY"] = createdBy;
    data["FOTO"] = foto;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["KETERANGAN"] = keterangan;
    data["LAP_KERUSAKAN"] = rencana_tindaklanjut;

    return data;
  }
}

class LapKerusakanFormModelResponse {
  final int status_code;
  final String message;
  final LapKerusakanFormModel? dataForm;

  LapKerusakanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class LapKerusakanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<LapKerusakanFormModel> dataForm;

  LapKerusakanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
