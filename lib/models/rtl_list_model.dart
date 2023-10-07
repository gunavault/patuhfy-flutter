class RtlListModel {
  String? rowstamp;
  String? rowstampAcuan;
  String? kategori;
  String? kodeJabatanApproval;
  String? deskripsi;
  String? status;
  String? createdBy;
  String? psaApproval;
  String? kodeJabatanSumitter;
  String? mobileCreatedAt;

  RtlListModel(
      {this.rowstamp,
      this.rowstampAcuan,
      this.kategori,
      this.kodeJabatanApproval,
      this.deskripsi,
      this.status,
      this.createdBy,
      this.psaApproval,
      this.kodeJabatanSumitter,
      this.mobileCreatedAt});

  RtlListModel.fromJson(Map<String, dynamic> json) {
    rowstamp = json["ROWSTAMP"];
    rowstampAcuan = json["ROWSTAMP_ACUAN"];
    kategori = json["KATEGORI"];
    kodeJabatanApproval = json["KODE_JABATAN_APPROVAL"];
    deskripsi = json["DESKRIPSI"];
    status = json["STATUS"];
    createdBy = json["CREATED_BY"];
    psaApproval = json["PSA_APPROVAL"];
    kodeJabatanSumitter = json["KODE_JABATAN_SUBMITTER"];
    mobileCreatedAt = json["MOBILE_CREATED_AT"];
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

class RtlListModelResponse {
  final int status_code;
  final String message;
  final RtlListModel? dataForm;

  RtlListModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RtlListModelSelectResponse {
  final int status_code;
  final String message;
  final List<RtlListModel> dataForm;

  RtlListModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
