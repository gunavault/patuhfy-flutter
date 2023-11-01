import 'package:floor/floor.dart';

@Entity(tableName: "t_real_penunasan")
class RealPenunasanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? afdeling;
  String? unitKerja;
  String? luas;
  int? rencanaLuasPenunasan;
  int? realisasiLuasPenunasan;
  String? penyebab;
  String? rtl;
  String? foto;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  int? hasRtl;

  RealPenunasanFormModel(
      {this.id,
      this.tanggal,
      this.createdBy,
      this.afdeling,
      this.unitKerja,
      this.luas,
      this.rencanaLuasPenunasan,
      this.realisasiLuasPenunasan,
      this.penyebab,
      this.rtl,
      this.foto,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.isSend,
      this.hasRtl});

  RealPenunasanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    luas = json["LUAS"].toString();
    rencanaLuasPenunasan = json["RENCANA_LUAS_PENUNASAN"];
    realisasiLuasPenunasan = json["REALISASI_LUAS_PENUNASAN"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    foto = json["FOTO"];
    lat = json["LAT"].toString();
    long = json["LONG"].toString();
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
    isSend = 1;
    hasRtl = json["HAS_RTL"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    data["CREATED_BY"] = createdBy;
    data["AFDELING"] = afdeling;
    data["UNIT_KERJA"] = unitKerja;
    data["LUAS"] = luas;
    data["RENCANA_LUAS_PENUNASAN"] = rencanaLuasPenunasan;
    data["REALISASI_LUAS_PENUNASAN"] = realisasiLuasPenunasan;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;
    data["HAS_RTL"] = hasRtl;
    data["FOTO"] = foto;

    return data;
  }
}

class RealPenunasanFormModelResponse {
  final int status_code;
  final String message;
  final RealPenunasanFormModel? dataForm;

  RealPenunasanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealPenunasanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPenunasanFormModel> dataForm;

  RealPenunasanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
