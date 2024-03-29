import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pemupukan", primaryKeys: ['id'])
class RealPemupukanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? unitKerja;
  String? afdeling;
  String? luas;
  String? rencanaLuasPemupukan;
  String? realisasiLuasPemupukan;
  String? penyebab;
  String? rtl;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  String? foto;
  int? hasRtl;

  RealPemupukanFormModel(
      {this.id,
      this.tanggal,
      this.createdBy,
      this.unitKerja,
      this.afdeling,
      this.luas,
      this.rencanaLuasPemupukan,
      this.realisasiLuasPemupukan,
      this.penyebab,
      this.rtl,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.isSend,
      this.foto,
      this.hasRtl});

  RealPemupukanFormModel.fromJson(Map<String, dynamic> json) {
    print('data json $json');
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    luas = json["LUAS"].toString();
    rencanaLuasPemupukan = json["RENCANA_LUAS_PEMUPUKAN"].toString();
    realisasiLuasPemupukan = json["REALISASI_LUAS_PEMUPUKAN"].toString();
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
    data["RENCANA_LUAS_PEMUPUKAN"] = rencanaLuasPemupukan;
    data["REALISASI_LUAS_PEMUPUKAN"] = realisasiLuasPemupukan;
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

class RealPemupukanFormModelResponse {
  final int status_code;
  final String message;
  final List<RealPemupukanFormModel>? dataForm;

  RealPemupukanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealPemupukanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPemupukanFormModel> dataForm;

  RealPemupukanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
