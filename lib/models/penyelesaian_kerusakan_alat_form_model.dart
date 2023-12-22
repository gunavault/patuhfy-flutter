class PenyelesaianKerusakanAlatModel {
  String? rowstamp;
  String? rowslaporan;
  String? foto;
  String? keteranganpenyelesaian;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;


  PenyelesaianKerusakanAlatModel(
      {this.rowstamp,
      this.rowslaporan,
      this.foto,
      this.keteranganpenyelesaian,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
});

  PenyelesaianKerusakanAlatModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    rowslaporan = json["ROWS_LAPORAN"];
    foto = json["FOTO"];
    keteranganpenyelesaian = json["KETERANGAN_PENYELESAIAN"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ROWS_LAPORAN"] = rowslaporan;
    data["FOTO"] = foto;
    data["KETERANGAN_PENYELESAIAN"] = keteranganpenyelesaian;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;


    return data;
  }
}

class PenyelesaianKerusakanAlatModelResponse {
  final int status_code;
  final String message;
  final PenyelesaianKerusakanAlatModel? dataForm;

  PenyelesaianKerusakanAlatModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class PenyelesaianKerusakanAlatModelSelectResponse {
  final int status_code;
  final String message;
    final PenyelesaianKerusakanAlatModel? dataForm;
  // final List<PenyelesaianKerusakanAlatModel> dataForm;

  PenyelesaianKerusakanAlatModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}

class PenyelesaianKerusakanAlatListModelSelectResponse {
  final int status_code;
  final String message;
  final List<PenyelesaianKerusakanAlatModel> dataForm;

  PenyelesaianKerusakanAlatListModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
