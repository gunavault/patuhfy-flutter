import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pemeliharaan_jalan")
class RealPemeliharaanJalanFormModel {
  @PrimaryKey(autoGenerate: true)
int? id;
  String? tanggal;
  int? createdBy;
  int? afdeling;
  // int? company;
  int? unitKerja;
  // int? blok;
  // int? tahunTanam;
  int? luas;
  int? rencanaluaspemeliharaanjalan;
  int? realisasiluaspemeliharaanjalan;
  String? penyebab;
  String? rtl;
  String? foto;
  double? lat;
  double? long;
  String? mobileCreatedAt;

  RealPemeliharaanJalanFormModel({
this.tanggal,
    this.createdBy,
    this.afdeling,
    // this.company,
    this.unitKerja,
    // this.blok,
    // this.tahunTanam,
    this.luas,
    this.rencanaluaspemeliharaanjalan,
    this.realisasiluaspemeliharaanjalan,
    this.penyebab,
    this.rtl,
    this.foto,
    this.lat,
    this.long,
    this.mobileCreatedAt,
      });

  RealPemeliharaanJalanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    // blok = json["BLOK"];
    // tahunTanam = json["TAHUN_TANAM"];
    luas = json["LUAS"];
    rencanaluaspemeliharaanjalan = json["RENCANA_LUAS_PEMELIHARAAN_JALAN"];
    realisasiluaspemeliharaanjalan = json["REALISASI_LUAS_PEMELIHARAAN_JALAN"];
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
    // data["BLOK"] = blok;
    // data["TAHUN_TANAM"] = tahunTanam;
    data["LUAS"] = luas;
    data["RENCANA_LUAS_PEMELIHARAAN_JALAN"] = rencanaluaspemeliharaanjalan;
    data["REALISASI_LUAS_PEMELIHARAAN_JALAN"] = realisasiluaspemeliharaanjalan;
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
  final RealPemeliharaanJalanFormModel? dataForm;

  LapKerusakanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class LapKerusakanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPemeliharaanJalanFormModel> dataForm;

  LapKerusakanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
