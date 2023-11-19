class WaktuPengamatanModel {
  String? kodeWaktuPengamatan;

  WaktuPengamatanModel({this.kodeWaktuPengamatan});

  WaktuPengamatanModel.fromJson(Map<String, dynamic> json) {
    kodeWaktuPengamatan = json["KODE"];
  }

  @override
  String toString() => kodeWaktuPengamatan.toString();
}

class WaktuPengamatanModelResponse {
  List<WaktuPengamatanModel> waktuPengamatanModel;
  String? message;

  WaktuPengamatanModelResponse(
      {required this.waktuPengamatanModel, this.message});
}
