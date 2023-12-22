class AnalisaKerusakanAlatModel {
  String? rowstamp;
  String? rowslaporan;
  String? jeniskerusakan;
  String? estimasipenyelesaian;
  String? ketersediansukucadang;
  String? detailkerusakan;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;


  AnalisaKerusakanAlatModel(
      {this.rowstamp,
      this.rowslaporan,
      this.jeniskerusakan,
      this.estimasipenyelesaian,
      this.ketersediansukucadang,
      this.detailkerusakan,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
});

  AnalisaKerusakanAlatModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    rowslaporan = json["ROWS_LAPORAN"];
    jeniskerusakan = json["JENIS_KERUSAKAN"];
    estimasipenyelesaian = json["ESTIMASI_PENYELESAIAN"];
    ketersediansukucadang = json["KETERSEDIAN_SUKU_CADANG"];
    detailkerusakan = json["DETAIL_KERUSAKAN"];

    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ROWS_LAPORAN"] = rowslaporan;
    data["JENIS_KERUSAKAN"] = jeniskerusakan;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["ESTIMASI_PENYELESAIAN"] = estimasipenyelesaian;
    data["KETERSEDIAN_SUKU_CADANG"] = ketersediansukucadang;
    data["DETAIL_KERUSAKAN"] = detailkerusakan;

    return data;
  }
}

class AnalisaKerusakanAlatModelResponse {
  final int status_code;
  final String message;
  final AnalisaKerusakanAlatModel? dataForm;

  AnalisaKerusakanAlatModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class AnalisaKerusakanAlatModelSelectResponse {
  final int status_code;
  final String message;
    final AnalisaKerusakanAlatModel? dataForm;
  // final List<AnalisaKerusakanAlatModel> dataForm;

  AnalisaKerusakanAlatModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}

class AnalisaKerusakanAlatListModelSelectResponse {
  final int status_code;
  final String message;
  final List<AnalisaKerusakanAlatModel> dataForm;

  AnalisaKerusakanAlatListModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
