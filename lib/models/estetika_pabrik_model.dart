class EstetikaPabrikFormModel {
  String? rowstamp;
  String? pks;
  String? stasiun;
  String? foto;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? waktuPengamatan;
  String? jenisKebersihan;

  int? isSend;

  EstetikaPabrikFormModel(
      {this.rowstamp,
      this.pks,
      this.stasiun,
      this.foto,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.waktuPengamatan,
      this.jenisKebersihan});

  EstetikaPabrikFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    pks = json["PKS"];
    stasiun = json["STASIUN"];
    foto = json["FOTO"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
    waktuPengamatan = json["WAKTU_PENGAMATAN"];
    jenisKebersihan = json["JENIS_KEBERSIHAN"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PKS"] = pks;
    data["STASIUN"] = stasiun;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["WAKTU_PENGAMATAN"] = waktuPengamatan;
    data["JENIS_KEBERSIHAN"] = jenisKebersihan;
    data["FOTO"] = foto;

    return data;
  }
}

class EstetikaPabrikFormModelResponse {
  final int status_code;
  final String message;
  final EstetikaPabrikFormModel? dataForm;

  EstetikaPabrikFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class EstetikaPabrikFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<EstetikaPabrikFormModel> dataForm;

  EstetikaPabrikFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
