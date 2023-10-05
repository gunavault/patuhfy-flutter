import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pemupukan")
class RealPemupukanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? unitKerja;
  String? afdeling;
  String? blok;
  int? tahunTanam;
  int? luas;
  int? rencanaLuasPemupukan;
  int? realisasiLuasPemupukan;
  String? penyebab;
  String? rtl;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  String? foto;

  RealPemupukanFormModel(
      {this.tanggal,
      this.createdBy,
      this.unitKerja,
      this.afdeling,
      this.blok,
      this.tahunTanam,
      this.luas,
      this.rencanaLuasPemupukan,
      this.realisasiLuasPemupukan,
      this.penyebab,
      this.rtl,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.isSend,
      this.foto});

  RealPemupukanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    luas = json["LUAS"];
    rencanaLuasPemupukan = json["RENCANA_LUAS_PEMUPUKAN"];
    realisasiLuasPemupukan = json["REALISASI_LUAS_PEMUPUKAN"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    lat = json["LAT"];
    long = json["LONG"];
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
    isSend = 1;
    foto = json["FOTO"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    data["CREATED_BY"] = createdBy;
    data["AFDELING"] = afdeling;
    data["UNIT_KERJA"] = unitKerja;
    data["BLOK"] = blok;
    data["TAHUN_TANAM"] = tahunTanam;
    data["LUAS"] = luas;
    data["RENCANA_LUAS_PEMUPUKAN"] = rencanaLuasPemupukan;
    data["REALISASI_LUAS_PEMUPUKAN"] = realisasiLuasPemupukan;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
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
