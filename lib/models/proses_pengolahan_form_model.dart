class ProsesPengolahanFormModel {
  String? rowstamp;
  String? pks;
  String? stasiun;
  String? foto;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? waktuPengamatan;
  String? tenagaKerjaPengoperasian;
  String? kondisiProses;

  ProsesPengolahanFormModel(
      {this.rowstamp,
      this.pks,
      this.stasiun,
      this.foto,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.waktuPengamatan,
      this.tenagaKerjaPengoperasian,
      this.kondisiProses});

  ProsesPengolahanFormModel.fromJson(Map<String, dynamic> json) {
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
    tenagaKerjaPengoperasian = json["TENAGA_KERJA_PENGOPERASIAN"];
    kondisiProses = json["KONDISI_PROSES"];
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
    data["TENAGA_KERJA_PENGOPERASIAN"] = tenagaKerjaPengoperasian;
    data["KONDISI_PROSES"] = kondisiProses;
    data["FOTO"] = foto;

    return data;
  }
}

class ProsesPengolahanFormModelResponse {
  final int status_code;
  final String message;
  final ProsesPengolahanFormModel? dataForm;

  ProsesPengolahanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class ProsesPengolahanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<ProsesPengolahanFormModel> dataForm;

  ProsesPengolahanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
