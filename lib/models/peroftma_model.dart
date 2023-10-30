class PerformaModel {
  String? APEL_PAGI;
  String? INSPEKSI_HANCA;
  String? INSPEKSI_TPH;
  String? HARI_PRODUKTIF;
  String? JUMLAH_TASK;
  double? PERSEN_TASK;


  PerformaModel(
      {this.APEL_PAGI,
      this.INSPEKSI_HANCA,
      this.INSPEKSI_TPH,
      this.HARI_PRODUKTIF,
      this.JUMLAH_TASK,
      this.PERSEN_TASK});

  PerformaModel.fromJson(Map<String, dynamic> json) {
    APEL_PAGI = json["APEL_PAGI"];
    INSPEKSI_HANCA = json["INSPEKSI_HANCA"];
    INSPEKSI_TPH = json["INSPEKSI_TPH"];
    HARI_PRODUKTIF = json["HARI_PRODUKTIF"];
    JUMLAH_TASK = json["JUMLAH_TASK"];
    PERSEN_TASK = double.parse(json["PERSEN_TASK"]);
  }
}

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["TANGGAL"] = tanggal;
//     data["MOBILE_CREATED_AT"] = mobileCreatedAt;
//     data["UNIT_KERJA"] = unitKerja;
//     data["AFDELING"] = afd;
//     data["BLOK"] = blok;
//     data["TAHUN_TANAM"] = tahunTanam;
//     data["REALISASI_PENCURIAN_TBS_TANDAN"] = realisasiPencurianTbsTandan;
//     data["REALISASI_PENCURIAN_TBS_KG"] = realisasiPencurianTbsKg;
//     data["BRONDOLAN_KG"] = brondolan;
//     data["FOTO"] = foto;
//     data["RTL"] = rtl;
//     data["CREATED_BY"] = createdBy;
//     data["LAT"] = lat;
//     data["LONG"] = long;

//     return data;
//   }
// }

class PerformaModelResponse {
  final int status_code;
  final String message;
  final PerformaModel? dataForm;

  PerformaModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class PerformaModelSelectResponse {
  final int status_code;
  final String message;
  final PerformaModel dataForm;

  PerformaModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
