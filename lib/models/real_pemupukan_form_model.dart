import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pemupukan")
class RealPemupukanFormModel {
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
  int? rencanaLuasPemupukan;
  int? realisasiLuasPemupukan;
  String? penyebab;
  String? rtl;
  String? foto64;
  double? lat;
  double? long;
  String? mobileCreatedAt;

  RealPemupukanFormModel({
this.tanggal,
    this.createdBy,
    this.afdeling,
    // this.company,
    this.unitKerja,
    this.blok,
    this.tahunTanam,
    this.luas,
    this.rencanaLuasPemupukan,
    this.realisasiLuasPemupukan,
    this.penyebab,
    this.rtl,
    this.foto64,
    this.lat,
    this.long,
    this.mobileCreatedAt,
      });

  RealPemupukanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    luas = json["LUAS"];
    rencanaLuasPemupukan = json["RENCANA_LUAS_PEMUPUKAN"];
    realisasiLuasPemupukan = json["REALISASI_LUAS_PEMUPUKAN"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    foto64 = json["FOTO64"];
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
    data["RENCANA_LUAS_PEMUPUKAN"] = rencanaLuasPemupukan;
    data["REALISASI_LUAS_PEMUPUKAN"] = realisasiLuasPemupukan;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["FOTO64"] = foto64;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;

    return data;
  }
}

class LapKerusakanFormModelResponse {
  final int status_code;
  final String message;
  final RealPemupukanFormModel? dataForm;

  LapKerusakanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class LapKerusakanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPemupukanFormModel> dataForm;

  LapKerusakanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
