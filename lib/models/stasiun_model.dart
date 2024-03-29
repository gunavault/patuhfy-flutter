class StasiunModel {
  String? kodeStasiun;
  String? namaStasiun;

  StasiunModel({this.kodeStasiun, this.namaStasiun});

  StasiunModel.fromJson(Map<String, dynamic> json) {
    kodeStasiun = json["KODE"];
    namaStasiun = json["NAMA_STASIUN"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["kodeStasiun"] = kodeStasiun;
  //   return data;
  // }

  @override
  String toString() => kodeStasiun.toString();
  String userAsString() {
    return '$kodeStasiun $namaStasiun';
  }
}

class StasiunModelResponse {
  List<StasiunModel> stasiunModel;
  String? message;

  StasiunModelResponse({required this.stasiunModel, this.message});
}
