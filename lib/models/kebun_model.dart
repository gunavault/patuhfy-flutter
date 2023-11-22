class KebunModel {
  String? kodeKebun;
  String? namaKebun;

  KebunModel({this.kodeKebun, this.namaKebun});

  KebunModel.fromJson(Map<String, dynamic> json) {
    kodeKebun = json["KODE"];
    namaKebun = json["NAMA"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["kodeKebun"] = kodeKebun;
  //   return data;
  // }

  @override
  String toString() => kodeKebun.toString();
}

class KebunModelResponse {
  List<KebunModel> Kebunmodel;
  String? message;

  KebunModelResponse({required this.Kebunmodel, this.message});
}
