import 'package:floor/floor.dart';

@Entity(tableName: "t_real_penyiangan", primaryKeys: ['id'])
class RealPenyianganFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? afdeling;
  String? unitKerja;
  String? luas;
  int? rencanaLuasPenyiangan;
  int? realisasiLuasPenyiangan;
  String? penyebab;
  String? rtl;
  String? foto;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  int? hasRtl;

  RealPenyianganFormModel(
      {this.id,
      this.tanggal,
      this.createdBy,
      this.afdeling,
      this.unitKerja,
      this.luas,
      this.rencanaLuasPenyiangan,
      this.realisasiLuasPenyiangan,
      this.penyebab,
      this.rtl,
      this.foto,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.isSend,
      this.hasRtl});

  RealPenyianganFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    luas = json["LUAS"].toString();
    rencanaLuasPenyiangan = json["RENCANA_LUAS_PENYIANGAN"];
    realisasiLuasPenyiangan = json["REALISASI_LUAS_PENYIANGAN"];
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
    data["RENCANA_LUAS_PENYIANGAN"] = rencanaLuasPenyiangan;
    data["REALISASI_LUAS_PENYIANGAN"] = realisasiLuasPenyiangan;
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

class RealPenyianganFormModelResponse {
  final int status_code;
  final String message;
  final RealPenyianganFormModel? dataForm;

  RealPenyianganFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealPenyianganFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPenyianganFormModel> dataForm;

  RealPenyianganFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
