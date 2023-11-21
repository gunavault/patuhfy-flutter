class CekSampelLosisFormModel {
  String? rowstamp;
  String? pks;
  String? stasiun;
  String? foto64;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? waktuPengamatan;
  String? sampellosis;
  String? jenissampel;
  String? beratsampel;
  String? hasillosis;

  CekSampelLosisFormModel(
      {this.rowstamp,
      this.pks,
      this.stasiun,
      this.foto64,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.waktuPengamatan,
      this.sampellosis,
      this.jenissampel,
      this.beratsampel,
      this.hasillosis});

  CekSampelLosisFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    pks = json["PKS"];
    stasiun = json["STASIUN"];
    foto64 = json["FOTO"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
    waktuPengamatan = json["WAKTU_PENGAMATAN"];
    sampellosis = json["SAMPEL_LOSIS"];
    jenissampel = json["JENIS_SAMPEL"];
    beratsampel = json["BERAT_SAMPEL"].toString();
    hasillosis = json["HASIL_LOSIS"].toString();  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PKS"] = pks;
    data["STASIUN"] = stasiun;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["WAKTU_PENGAMATAN"] = waktuPengamatan;
    data["FOTO64"] = foto64;
    data["SAMPEL_LOSIS"] = sampellosis;
    data["JENIS_SAMPEL"] = jenissampel;
    data["BERAT_SAMPEL"] = beratsampel;
    data["HASIL_LOSIS"] = hasillosis;

    return data;
  }
}

class CekSampelLosisFormModelResponse {
  final int status_code;
  final String message;
  final CekSampelLosisFormModel? dataForm;

  CekSampelLosisFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class CekSampelLosisFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<CekSampelLosisFormModel> dataForm;

  CekSampelLosisFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
