import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pengendalian_hama")
class RealPengendalianHamaFormModel {
  @PrimaryKey(autoGenerate: true)
int? id;
  String? tanggal;
  int? createdBy;
  int? afdeling;
  // int? company;
  int? unitKerja;
  int? blok;
  int? tahunTanam;
  int? luas;
  int? rencanaluaspengendalian;
  int? realisasiluaspengendalian;
  String? penyebab;
  String? rtl;
  String? foto;
  double? lat;
  double? long;
  String? mobileCreatedAt;

  RealPengendalianHamaFormModel({
this.tanggal,
    this.createdBy,
    this.afdeling,
    // this.company,
    this.unitKerja,
    this.blok,
    this.tahunTanam,
    this.luas,
    this.rencanaluaspengendalian,
    this.realisasiluaspengendalian,
    this.penyebab,
    this.rtl,
    this.foto,
    this.lat,
    this.long,
    this.mobileCreatedAt,
      });

  RealPengendalianHamaFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    luas = json["LUAS"];
    rencanaluaspengendalian = json["RENCANA_LUAS_PENGENDALIAN"];
    realisasiluaspengendalian = json["REALISASI_LUAS_PENGENDALIAN"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    foto = json["FOTO"];
    lat = json["LAT"];
    long = json["LONG"];
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
  }

  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    data["CREATED_BY"] = createdBy;
    data["AFDELING"] = afdeling;
    // data["COMPANY"] = company;
    data["UNIT_KERJA"] = unitKerja;
    data["BLOK"] = blok;
    data["TAHUN_TANAM"] = tahunTanam;
    data["LUAS"] = luas;
    data["RENCANA_LUAS_PENGENDALIAN"] = rencanaluaspengendalian;
    data["REALISASI_LUAS_PENGENDALIAN"] = realisasiluaspengendalian;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["FOTO"] = foto;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;

    return data;
  }
}

class LapKerusakanFormModelResponse {
  final int status_code;
  final String message;
  final RealPengendalianHamaFormModel? dataForm;

  LapKerusakanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class LapKerusakanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPengendalianHamaFormModel> dataForm;

  LapKerusakanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
