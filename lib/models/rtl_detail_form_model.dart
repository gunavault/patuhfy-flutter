class RtlDetailFormModel {
  String? rowstampAcuan;
  String? tanggalRtl;
  String? deskripsiRtl;
  String? tanggalRealisasi;
  String? deskripsiRealisasi;
  String? evidence;
  String? createdBy;

  RtlDetailFormModel(
      {this.rowstampAcuan,
      this.tanggalRtl,
      this.deskripsiRtl,
      this.tanggalRealisasi,
      this.deskripsiRealisasi,
      this.evidence,
      this.createdBy});

  RtlDetailFormModel.fromJson(Map<String, dynamic> json) {
    rowstampAcuan = json["ROWSTAMP_ACUAN"];
    tanggalRtl = json["TANGGAL_RTL"];
    deskripsiRtl = json["DESKRIPSI_RTL"];
    tanggalRealisasi = json["TANGGAL_REALISASI"];
    deskripsiRealisasi = json["DESKRIPSI_REALISASI"];
    evidence = json["EVIDENCE"];
    createdBy = json["CREATED_BY"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ROWSTAMP_ACUAN"] = rowstampAcuan;
    data["TANGGAL_RTL"] = tanggalRtl;
    data["DESKRIPSI_RTL"] = deskripsiRtl;
    data["TANGGAL_REALISASI"] = tanggalRealisasi;
    data["DESKRIPSI_REALISASI"] = deskripsiRealisasi;
    data["EVIDENCE"] = evidence;
    data["CREATED_BY"] = createdBy;

    return data;
  }
}

class RtlDetailFormModelResponse {
  final int status_code;
  final String message;
  final RtlDetailFormModel? dataForm;

  RtlDetailFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class RtlDetailFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RtlDetailFormModel> dataForm;

  RtlDetailFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
