import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pengendalian_hama", primaryKeys: ['id'])
class RealPengendalianHamaFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? unitKerja;
  String? afdeling;
  String? luas;
  String? rencanaLuasPengendalianHama;
  String? realisasiLuasPengendalianHama;
  String? penyebab;
  String? rtl;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  String? foto;
  int? hasRtl;

  RealPengendalianHamaFormModel(
      {this.id,
      this.tanggal,
      this.createdBy,
      this.unitKerja,
      this.afdeling,
      this.luas,
      this.rencanaLuasPengendalianHama,
      this.realisasiLuasPengendalianHama,
      this.penyebab,
      this.rtl,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.isSend,
      this.foto,
      this.hasRtl});

  RealPengendalianHamaFormModel.fromJson(Map<String, dynamic> json) {
    print('data json $json');
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    luas = json["LUAS"].toString();
    rencanaLuasPengendalianHama =
        json["RENCANA_LUAS_PENGENDALIAN_HAMA"].toString();
    realisasiLuasPengendalianHama =
        json["REALISASI_LUAS_PENGENDALIAN_HAMA"].toString();
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    lat = json["LAT"].toString();
    long = json["LONG"].toString();
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
    isSend = 1;
    foto = json["FOTO"];
    hasRtl = json['HAS_RTL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    print('data111 hasRtl $hasRtl');
    data["TANGGAL"] = tanggal;
    data["CREATED_BY"] = createdBy;
    data["AFDELING"] = afdeling;
    data["UNIT_KERJA"] = unitKerja;
    data["LUAS"] = luas;
    data["RENCANA_LUAS_PENGENDALIAN_HAMA"] = rencanaLuasPengendalianHama;
    data["REALISASI_LUAS_PENGENDALIAN_HAMA"] = realisasiLuasPengendalianHama;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["HAS_RTL"] = hasRtl;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;
    data["FOTO"] = foto;

    return data;
  }
}

class RealPengendalianHamaFormModelResponse {
  final int status_code;
  final String message;
  final List<RealPengendalianHamaFormModel>? dataForm;

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
