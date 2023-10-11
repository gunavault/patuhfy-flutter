import 'package:floor/floor.dart';

@Entity(tableName: "t_real_restan")
class RealRestanFormModel {
  @PrimaryKey(autoGenerate: true)
    int? id;
    String? tanggal;
    String? unitKerja;
    String? afdeling;
    int? jmlTandanDipanen;
    int? jmlTandanDiangkut;
    int? restanHi;
    int? restanKemarin;
    int? restanTotal;
    String? ketKendala;
    String? ketTindakLanjut;
    int? kapasitasAngkutanPerton;
    int? kebutuhanArmadaAngkut;
    String? lat;
    String? long;
    String? mobileCreatedAt;
    String? createdBy;
    int? isSend;
    int? hasRtl;

  RealRestanFormModel(
      {
      this.tanggal,
      this.unitKerja,
      this.afdeling,
      this.jmlTandanDipanen,
      this.jmlTandanDiangkut,
      this.restanHi,
      this.restanKemarin,
      this.restanTotal,
      this.ketKendala,
      this.ketTindakLanjut,
      this.kapasitasAngkutanPerton,
      this.kebutuhanArmadaAngkut,
      this.lat,
      this.long,
      this.mobileCreatedAt,
      this.createdBy,
      this.isSend,
      this.hasRtl
      });

  RealRestanFormModel.fromJson(Map<String, dynamic> json) {
    print('data json $json');
    tanggal = json["TANGGAL"];
    createdBy = json["CREATED_BY"];
    afdeling = json["AFDELING"];
    unitKerja = json["UNIT_KERJA"];
    jmlTandanDipanen = json["JML_TANDAN_DIPANEN"];
    jmlTandanDiangkut = json["JML_TANDAN_DIANGKUT"];
    restanHi = json["RESTAN_HI"];
    restanKemarin = json["RESTAN_KEMARIN"];
    restanTotal = json["RESTAN_TOTAL"];
    ketKendala = json["KET_KENDALA"];
    ketTindakLanjut = json["KET_TINDAK_LANJUT"];
    kapasitasAngkutanPerton = json["KAPASITAS_ANGKUTAN_PERTON"];
    kebutuhanArmadaAngkut = json["KEBUTUHAN_ARMADA_ANGKUT"];
    lat = json["LAT"];
    long = json["LONG"];
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
    isSend = 1;
    hasRtl = json['HAS_RTL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    print('data111 hasRtl $hasRtl');
    data["TANGGAL"] = tanggal;
    data["CREATED_BY"] = createdBy;
    data["AFDELING"] = afdeling;
    data["UNIT_KERJA"] = unitKerja;
    data["JML_TANDAN_DIPANEN"] = jmlTandanDipanen;
    data["JML_TANDAN_DIANGKUT"] = jmlTandanDiangkut;
    // data["RESTAN_HI"] = restanHi;
    data["RESTAN_KEMARIN"] = restanKemarin;
    // data["RESTAN_TOTAL"] = restanTotal;
    data["KET_KENDALA"] = ketKendala;
    data["KET_TINDAK_LANJUT"] = ketTindakLanjut;
    data["KAPASITAS_ANGKUTAN_PERTON"] = kapasitasAngkutanPerton;
    data["KEBUTUHAN_ARMADA_ANGKUT"] = kebutuhanArmadaAngkut;
    data["LAT"] = lat;
    data["LONG"] = long;
    data["MOBILE_CREATED_AT"] = mobileCreatedAt;
    data["HAS_RTL"] = hasRtl;

    return data;
  }
}

class RealRestanFormModelResponse {
  final int status_code;
  final String message;
  final List<RealRestanFormModel>? dataForm;

  RealRestanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RealRestanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealRestanFormModel> dataForm;

  RealRestanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
