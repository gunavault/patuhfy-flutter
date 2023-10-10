class RtlDetailUpdateStatusFormModel {
  String? rowstamp;
  String? updatedBy;
  String? status;
  String? keteranganStatus;

  RtlDetailUpdateStatusFormModel(
      {this.rowstamp, this.updatedBy, this.status, this.keteranganStatus});

  RtlDetailUpdateStatusFormModel.fromJson(Map<String, dynamic> json) {
    rowstamp = json["ROWSTAMP"];
    updatedBy = json["UPDATED_BY"];
    status = json["STATUS"];
    keteranganStatus = json["KETERANGAN_STATUS"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ROWSTAMP"] = rowstamp;
    data["UPDATED_BY"] = updatedBy;
    data["STATUS"] = status;
    data["KETERANGAN_STATUS"] = keteranganStatus;

    return data;
  }
}

class RtlDetailUpdateStatusFormModelResponse {
  final int status_code;
  final String message;
  final String? rowstamp;

  RtlDetailUpdateStatusFormModelResponse(
      {required this.status_code, required this.message, this.rowstamp});
}

// class RtlDetailUpdateStatusFormModelSelectResponse {
//   final int status_code;
//   final String message;
//   final List<RtlDetailUpdateStatusFormModel> dataForm;

//   RtlDetailUpdateStatusFormModelSelectResponse(
//       {required this.status_code,
//       required this.message,
//       required this.dataForm});
// }
