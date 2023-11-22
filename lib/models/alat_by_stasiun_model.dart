class AlatByStasiunModel {
  String? kodeAlat;
  String? kodeStasiun;
  String? namaAlat;

  AlatByStasiunModel({this.kodeAlat, this.kodeStasiun, this.namaAlat});

  AlatByStasiunModel.fromJson(Map<String, dynamic> json) {
    kodeAlat = json["KODE"];
    kodeStasiun = json["KODE_STASIUN"];
    namaAlat = json["NAMA"];
  }

  @override
  String toString() => kodeAlat.toString();
  String userAsString() {
    return '$kodeAlat $namaAlat';
  }
}

class AlatByStasiunModelResponse {
  List<AlatByStasiunModel> alatByStasiunModel;
  String? message;

  AlatByStasiunModelResponse({required this.alatByStasiunModel, this.message});
}
