import 'package:floor/floor.dart';

@Entity(tableName: "t_real_pusingan_panen", primaryKeys: ['id'])
class RealPusinganPanenFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? createdBy;
  String? afdeling;
  String? unitKerja;
  String? blok;
  int? tahunTanam;
  int? rotasipanen;
  int? normapusingan;
  int? pusingan9hari;
  int? pusingan10hari;
  int? pusingan11hari;
  int? pusingan12harilebih;
  String? penyebab;
  String? rtl;
  String? lat;
  String? long;
  String? mobileCreatedAt;
  int? isSend;
  int? hasRtl;

  RealPusinganPanenFormModel(
      {this.id,
      this.tanggal,
      this.createdBy,
      this.afdeling,
      // this.company,
      this.unitKerja,
      this.blok,
      this.tahunTanam,
      this.rotasipanen,
      this.normapusingan,
      this.pusingan9hari,
      this.pusingan10hari,
      this.pusingan11hari,
      this.pusingan12harilebih,
      this.penyebab,
      this.rtl,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.isSend,
      this.hasRtl});

  RealPusinganPanenFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    rotasipanen = json["ROTASI_PANEN"];
    normapusingan = json["NORMA_PUSINGAN"];
    pusingan9hari = json["PUSINGAN_9_HARI"];
    pusingan10hari = json["PUSINGAN_10_HARI"];
    pusingan11hari = json["PUSINGAN_11_HARI"];
    pusingan12harilebih = json["PUSINGAN_12_HARI_LEBIH"];
    penyebab = json["PENYEBAB"];
    rtl = json["RTL"];
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
    data["BLOK"] = blok;
    data["TAHUN_TANAM"] = tahunTanam;
    data["ROTASI_PANEN"] = rotasipanen;
    data["NORMA_PUSINGAN"] = normapusingan;
    data["PUSINGAN_9_HARI"] = pusingan9hari;
    data["PUSINGAN_10_HARI"] = pusingan10hari;
    data["PUSINGAN_11_HARI"] = pusingan11hari;
    data["PUSINGAN_12_HARI_LEBIH"] = pusingan12harilebih;
    data["PENYEBAB"] = penyebab;
    data["RTL"] = rtl;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;
    data["HAS_RTL"] = hasRtl;

    return data;
  }
}

class RealPusinganPanenFormModelResponse {
  final int status_code;
  final String message;
  final RealPusinganPanenFormModel? dataForm;

  RealPusinganPanenFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealPusinganPanenFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealPusinganPanenFormModel> dataForm;

  RealPusinganPanenFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
