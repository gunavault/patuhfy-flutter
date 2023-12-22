class JenisKerusakanModel {
  String? kodeJenisKerusakan;
  String? namaJenisKerusakan;

  JenisKerusakanModel({this.kodeJenisKerusakan, this.namaJenisKerusakan});

  JenisKerusakanModel.fromJson(Map<String, dynamic> json) {
    kodeJenisKerusakan = json["KODE"];
    namaJenisKerusakan = json["JENIS_KERUSAKAN"];
  }

  @override
  String toString() => namaJenisKerusakan.toString();
}

class JenisKerusakanModelResponse {
  List<JenisKerusakanModel> jeniskerusakanmodel;
  String? message;

  JenisKerusakanModelResponse(
      {required this.jeniskerusakanmodel, this.message});
}
