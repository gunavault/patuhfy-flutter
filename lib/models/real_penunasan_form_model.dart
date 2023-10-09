import 'package:floor/floor.dart';

@Entity(tableName: "t_real_penunasan")
class RealPenunasanFormModel {
  @PrimaryKey(autoGenerate: true)
int? id;
  String? tanggal;
  String? createdBy;
  String? afdeling;
  // int? company;
  String? unitKerja;
  int? blok;
  int? tahunTanam;
  int? luas;
  int? rencanaLuasPenunasan;
  int? realisasiLuasPenunasan;
  String? penyebab;
  String? rtl;
  String? foto;
  String? lat;
  String? long;
  String? mobileCreatedAt;

  RealPenunasanFormModel({
this.tanggal,
    this.createdBy,
    this.afdeling,
    // this.company,
    this.unitKerja,
    this.blok,
    this.tahunTanam,
    this.luas,
    this.rencanaLuasPenunasan,
    this.realisasiLuasPenunasan,
    this.penyebab,
    this.rtl,
    this.foto,
    this.lat,
    this.long,
    this.mobileCreatedAt,
      });

  RealPenunasanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    luas = json["LUAS"];
    rencanaLuasPenunasan = json["RENCANA_LUAS_PENUNASAN"];
    realisasiLuasPenunasan = json["REALISASI_LUAS_PENUNASAN"];
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
    data["RENCANA_LUAS_PENUNASAN"] = rencanaLuasPenunasan;
    data["REALISASI_LUAS_PENUNASAN"] = realisasiLuasPenunasan;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["FOTO"] = foto;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;

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
