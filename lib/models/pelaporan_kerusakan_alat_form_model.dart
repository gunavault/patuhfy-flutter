class PelaporanKerusakanAlatFormModel {
  String? rowstamp;
  String? pks;
  String? stasiun;
  String? alat;
  String? kondisiPks;
  String? keterangan;
  String? foto;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? status;
  String? namaStasiun;
  String? namaAlat;
  String? namaPks;

  PelaporanKerusakanAlatFormModel(
      {this.rowstamp,
      this.pks,
      this.stasiun,
      this.alat,
      this.kondisiPks,
      this.keterangan,
      this.foto,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.status});

  PelaporanKerusakanAlatFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    pks = json["PKS"];
    stasiun = json["STASIUN"];
    alat = json["ALAT"];
    kondisiPks = json["KONDISI_PKS"];
    keterangan = json["KETERANGAN"];
    foto = json["FOTO"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    namaStasiun = json["NAMA_STASIUN"];
    namaAlat = json["NAMA_ALAT"];
    createdBy = json["CREATED_BY"];
    namaPks = json["NAMA_PKS"];
    status = json["STATUS"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PKS"] = pks;
    data["STASIUN"] = stasiun;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["ALAT"] = alat;
    data["KONDISI_PKS"] = kondisiPks;
    data["KETERANGAN"] = keterangan;
    data["FOTO"] = foto;

    return data;
  }
}

class PelaporanKerusakanAlatFormModelResponse {
  final int status_code;
  final String message;
  final PelaporanKerusakanAlatFormModel? dataForm;

  PelaporanKerusakanAlatFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class PelaporanKerusakanAlatFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<PelaporanKerusakanAlatFormModel> dataForm;

  PelaporanKerusakanAlatFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}

class PelaporanKerusakanAlatListModelSelectResponse {
  final int status_code;
  final String message;
  final List<PelaporanKerusakanAlatFormModel> dataForm;

  PelaporanKerusakanAlatListModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
