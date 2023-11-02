import 'package:floor/floor.dart';

@Entity(tableName: "t_real_rencana_pengangkutan", primaryKeys: ['id'])
class RealRencanapengangkutanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  int? createdBy;
  int? afdeling;
  // int? company;
  int? unitKerja;
  // int? blok;
  // int? tahunTanam;
  int? akprealisasi;
  int? tandanpanenhariini;
  int? jmltrukhariini;
  String? kendala;
  String? rencanatindaklanjut;
  String? rencanaakpbesok;
  String? rencanatandanpanenbesok;
  String? rencantrukbesok;
  double? lat;
  double? long;
  String? mobileCreatedAt;

  RealRencanapengangkutanFormModel({
    this.tanggal,
    this.createdBy,
    this.afdeling,
    // this.company,
    this.unitKerja,
    // this.blok,
    // this.tahunTanam,
    this.akprealisasi,
    this.tandanpanenhariini,
    this.jmltrukhariini,
    this.kendala,
    this.rencanatindaklanjut,
    this.rencanaakpbesok,
    this.rencanatandanpanenbesok,
    this.rencantrukbesok,
    this.lat,
    this.long,
    this.mobileCreatedAt,
  });

  RealRencanapengangkutanFormModel.fromJson(Map<String, dynamic> json) {
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    // company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    // blok = json["BLOK"];
    // tahunTanam = json["TAHUN_TANAM"];
    akprealisasi = json["AKP_REALISASI"];
    tandanpanenhariini = json["TANDAN_PANEN_HARI_INI"];
    jmltrukhariini = json["JML_TRUK_HARI_INI"];
    kendala = json["KENDALA"];
    rencanatindaklanjut = json["RENCANA_TINDAK_LANJUT"];
    rencanaakpbesok = json["RENCANA_AKP_BESOK"];
    rencanatandanpanenbesok = json["RENCANA_TANDAN_PANEN_BESOK"];
    rencantrukbesok = json["RENCANA_TRUK_BESOK"];
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
    data["AKP_REALISASI"] = akprealisasi;
    data["TANDAN_PANEN_HARI_INI"] = tandanpanenhariini;
    data["JML_TRUK_HARI_INI"] = jmltrukhariini;
    data["KENDALA"] = kendala;
    data["RENCANA_TINDAK_LANJUT"] = rencanatindaklanjut;
    data["RENCANA_AKP_BESOK"] = rencanaakpbesok;
    data["RENCANA_TANDAN_PANEN_BESOK"] = rencanatandanpanenbesok;
    data["RENCANA_TRUK_BESOK"] = rencantrukbesok;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;

    return data;
  }
}

class RealRencanapengangkutanFormModelResponse {
  final int status_code;
  final String message;
  final RealRencanapengangkutanFormModel? dataForm;

  RealRencanapengangkutanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealRencanapengangkutanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealRencanapengangkutanFormModel> dataForm;

  RealRencanapengangkutanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
