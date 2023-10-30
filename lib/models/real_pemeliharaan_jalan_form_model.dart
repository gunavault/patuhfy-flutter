import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pemeliharaan_jalan")
class RealPemeliharaanJalanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? afdeling;
  String? unitKerja;
  int? rencanaluaspemeliharaanjalan;
  int? realisasiluaspemeliharaanjalan;
  String? penyebab;
  String? rtl;
  String? foto;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? hasRtl;
  int? isSend;



  RealPemeliharaanJalanFormModel({
this.tanggal,
    this.createdBy,
    this.afdeling,
    // this.company,
    this.unitKerja,
    // this.blok,
    // this.tahunTanam,
    // this.luas,
    this.rencanaluaspemeliharaanjalan,
    this.realisasiluaspemeliharaanjalan,
    this.penyebab,
    this.rtl,
    this.foto,
    this.lat,
    this.long,
    this.mobileCreatedAt,
    this.hasRtl,
    this.isSend
      });

  RealPemeliharaanJalanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    rencanaluaspemeliharaanjalan = json["RENCANA_LUAS_PEMELIHARAAN_JALAN"];
    realisasiluaspemeliharaanjalan = json["REALISASI_LUAS_PEMELIHARAAN_JALAN"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
    foto = json["FOTO"];
    lat = json["LAT"].toString();
    long = json["LONG"].toString();
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
    data["RENCANA_LUAS_PEMELIHARAAN_JALAN"] = rencanaluaspemeliharaanjalan;
    data["REALISASI_LUAS_PEMELIHARAAN_JALAN"] = realisasiluaspemeliharaanjalan;
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

class RealPemeliharaanJalanFormModelResponse {
  final int status_code;
  final String message;
  final RealPemeliharaanJalanFormModel? dataForm;

  RealPemeliharaanJalanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealPemeliharaanJalanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPemeliharaanJalanFormModel> dataForm;

  RealPemeliharaanJalanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
