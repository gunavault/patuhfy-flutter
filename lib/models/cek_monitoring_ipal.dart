class CekMonitoringIpalFormModel {
  String? rowstamp;
  String? pks;
  String? foto64;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? waktuPengamatan;
  String? debitairmasuk;
  String? debitairkeluar;
  String? selisihdebit;
  String? ph;
  String? temperatur;

  CekMonitoringIpalFormModel(
      {this.rowstamp,
      this.pks,
      this.foto64,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.waktuPengamatan,
      this.debitairmasuk,
      this.debitairkeluar,
      this.selisihdebit,
      this.ph,
      this.temperatur});

  CekMonitoringIpalFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    pks = json["PKS"];
    foto64 = json["FOTO"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
    waktuPengamatan = json["WAKTU_PENGAMATAN"];
    debitairmasuk = json["DEBIT_AIR_MASUK"].toString();
    debitairkeluar = json["DEBIT_AIR_KELUAR"].toString();
    selisihdebit = json["SELISIH_DEBIT"].toString();
    ph = json["PH"].toString();
    temperatur = json["TEMPERATUR"].toString();  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PKS"] = pks;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["WAKTU_PENGAMATAN"] = waktuPengamatan;
    data["FOTO64"] = foto64;
    data["DEBIT_AIR_MASUK"] = debitairmasuk;
    data["DEBIT_AIR_KELUAR"] = debitairkeluar;
    data["PH"] = ph;
    data["TEMPERATUR"] = temperatur;

    return data;
  }
}

class CekMonitoringIpalFormModelResponse {
  final int status_code;
  final String message;
  final CekMonitoringIpalFormModel? dataForm;

  CekMonitoringIpalFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class CekMonitoringIpalFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<CekMonitoringIpalFormModel> dataForm;

  CekMonitoringIpalFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
