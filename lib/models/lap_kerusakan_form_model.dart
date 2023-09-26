import 'package:floor/floor.dart';

@Entity(tableName: "t_lap_kerusakan")
class LapKerusakanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? company;
  String? unitKerja;
  String? afd;
  String? foto;
  String? createdBy;
  String? long;
  String? lat;
  String? keterangan;
  String? rencana_tindaklanjut;

  LapKerusakanFormModel(
      {this.tanggal,
      this.company,
      this.unitKerja,
      this.afd,
      this.foto,
      this.createdBy,
      this.long,
      this.lat,
      this.keterangan,
      this.rencana_tindaklanjut,});

  LapKerusakanFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    tanggal = json["TANGGAL"];
    company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    afd = json["AFDELING"];
    foto = json["FOTO"];
    createdBy = json["CREATED_BY"];
    long = json["LONG"];
    lat = json["LAT"];
    keterangan = json["KETERANGAN"];
    rencana_tindaklanjut = json["RENCANA_TINDAKLANJUT"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    data["COMPANY"] = company;
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
