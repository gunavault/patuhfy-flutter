class RtlDetailListModel {
  String? rowstamp;
  String? rowstampAcuan;
  String? tanggalRtl;
  String? noRtl;
  String? deskripsiRtl;
  String? tanggalRealisasiRtl;
  String? deskripsiRealisasiRtl;
  String? status;
  String? evidence;
  String? keteranganStatus;
  String? createdBy;

  RtlDetailListModel(
      {this.rowstamp,
      this.rowstampAcuan,
      this.tanggalRtl,
      this.noRtl,
      this.deskripsiRtl,
      this.tanggalRealisasiRtl,
      this.deskripsiRealisasiRtl,
      this.status,
      this.evidence,
      this.keteranganStatus,
      this.createdBy});

  RtlDetailListModel.fromJson(Map<String, dynamic> json) {
    rowstamp = json["ROWSTAMP"];
    rowstampAcuan = json["ROWSTAMP_ACUAN"];
    tanggalRtl = json["TANGGAL_RTL"];
    tanggalRealisasiRtl = json["TANGGAL_REALISASI"];
    noRtl = json["NO_RTL"];
    deskripsiRtl = json["DESKRIPSI_RTL"];
    deskripsiRealisasiRtl = json["DESKRIPSI_REALISASI"];
    status = json["STATUS"];
    evidence = json["EVIDENCE"];
    keteranganStatus = json["KETERANGAN_STATUS"];
    createdBy = json["CREATED_BY"];
  }
}

class RtlDetailListModelResponse {
  final int status_code;
  final String message;
  final RtlDetailListModel? dataForm;

  RtlDetailListModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RtlDetailListModelSelectResponse {
  final int status_code;
  final String message;
  final List<RtlDetailListModel> dataForm;

  RtlDetailListModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
