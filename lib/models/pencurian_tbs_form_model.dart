import 'package:floor/floor.dart';

@Entity(tableName: "t_pencurian_tbs")
class PencurianTbsFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  // String? company;
  String? unitKerja;
  String? afd;
  String? foto;
  String? blok;
  int? tahunTanam;
  int? realisasiPencurianTbsTandan;
  int? realisasiPencurianTbsKg;
  String? rtl;
  String? createdBy;
  String? long;
  String? lat;
  int? isSend;

  PencurianTbsFormModel(
      {this.tanggal,
      // this.company,
      this.unitKerja,
      this.afd,
      this.blok,
      this.tahunTanam,
      this.realisasiPencurianTbsTandan,
      this.realisasiPencurianTbsKg,
      this.foto,
      this.rtl,
      this.createdBy,
      this.long,
      this.lat,
      this.isSend});

  PencurianTbsFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    tanggal = json["TANGGAL"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    afd = json["AFDELING"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    realisasiPencurianTbsTandan = json["REALISASI_PENCURIAN_TBS_TANDAN"];
    realisasiPencurianTbsKg = json["REALISASI_PENCURIAN_TBS_KG"];
    foto = json["FOTO"];
    rtl = json["RTL"];
    createdBy = json["CREATED_BY"];
    lat = json["LAT"].toString();
    long = json["LONG"].toString();
    isSend = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    // data["COMPANY"] = company;
    data["UNIT_KERJA"] = unitKerja;
    data["AFDELING"] = afd;
    data["BLOK"] = blok;
    data["TAHUN_TANAM"] = tahunTanam;
    data["REALISASI_PENCURIAN_TBS_TANDAN"] = realisasiPencurianTbsTandan;
    data["REALISASI_PENCURIAN_TBS_KG"] = realisasiPencurianTbsKg;
    data["FOTO"] = foto;
    data["RTL"] = rtl;
    data["CREATED_BY"] = createdBy;
    data["LAT"] = lat;
    data["LONG"] = long;

    return data;
  }
}

class PencurianTbsFormModelResponse {
  final int status_code;
  final String message;
  final PencurianTbsFormModel? dataForm;

  PencurianTbsFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class PencurianTbsFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<PencurianTbsFormModel> dataForm;

  PencurianTbsFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
