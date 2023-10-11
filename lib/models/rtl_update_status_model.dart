import 'package:patuhfy/models/rtl_list_model.dart';

class RtlUpdateStatusFormModel {
  String? rowstamp;
  String? updatedBy;
  String? status;
  String? keteranganStatus;

  RtlUpdateStatusFormModel(
      {this.rowstamp, this.updatedBy, this.status, this.keteranganStatus});

  RtlUpdateStatusFormModel.fromJson(Map<String, dynamic> json) {
    rowstamp = json["ROWSTAMP"];
    updatedBy = json["UPDATED_BY"];
    status = json["STATUS"];
    keteranganStatus = json["KETERANGAN_STATUS"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ROWSTAMP"] = rowstamp;
    data["UPDATED_BY"] = updatedBy;
    data["STATUS"] = 'CLOSED';
    data["KETERANGAN_STATUS"] = keteranganStatus;

    return data;
  }
}

class RtlUpdateStatusFormModelResponse {
  final int status_code;
  final String message;
  final String? rowstamp;
  final RtlListModel rtlData;

  RtlUpdateStatusFormModelResponse(
      {required this.status_code,
      required this.message,
      this.rowstamp,
      required this.rtlData});
}

// class RtlUpdateStatusFormModelSelectResponse {
//   final int status_code;
//   final String message;
//   final List<RtlUpdateStatusFormModel> dataForm;

//   RtlUpdateStatusFormModelSelectResponse(
//       {required this.status_code,
//       required this.message,
//       required this.dataForm});
// }
