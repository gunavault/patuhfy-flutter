import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pengendalian_hama")
class RealPengendalianHamaFormModel {
  @PrimaryKey(autoGenerate: true)
int? id;
  String? tanggal;
  String? createdBy;
  String? afdeling;
  String? unitKerja;
  String? luas;
  int? rencanaluaspengendalian;
  int? realisasiluaspengendalian;
  String? penyebab;
  String? rtl;
  String? foto;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  int? hasRtl;

  RealPengendalianHamaFormModel({
this.tanggal,
    this.createdBy,
    this.afdeling,
    this.unitKerja,
    this.luas,
    this.rencanaluaspengendalian,
    this.realisasiluaspengendalian,
    this.penyebab,
    this.rtl,
    this.foto,
    this.lat,
    this.long,
    this.mobileCreatedAt,
    this.isSend,
    this.hasRtl
      });

  RealPengendalianHamaFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    luas = json["LUAS"];
    rencanaluaspengendalian = json["RENCANA_LUAS_PENGENDALIAN"];
    realisasiluaspengendalian = json["REALISASI_LUAS_PENGENDALIAN"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    foto = json["FOTO"];
    lat = json["LAT"];
    long = json["LONG"];
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
    isSend = 1;
    hasRtl = json['HAS_RTL'];
  }

  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    data["CREATED_BY"] = createdBy;
    data["AFDELING"] = afdeling;
    data["UNIT_KERJA"] = unitKerja;
    data["LUAS"] = luas;
    data["RENCANA_LUAS_PENGENDALIAN"] = rencanaluaspengendalian;
    data["REALISASI_LUAS_PENGENDALIAN"] = realisasiluaspengendalian;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["FOTO"] = foto;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;
    data["HAS_RTL"] = hasRtl;

    return data;
  }
}

class RealPengendalianHamaFormModelResponse {
  final int status_code;
  final String message;
  final RealPengendalianHamaFormModel? dataForm;

  RealPengendalianHamaFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealPengendalianHamaFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPengendalianHamaFormModel> dataForm;

  RealPengendalianHamaFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
