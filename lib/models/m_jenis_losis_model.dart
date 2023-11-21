class JenisSampelModel {
  String? kodelosis;
  String? namasampellosis;
  String? jenissampellosis;

  JenisSampelModel({this.kodelosis, this.namasampellosis, this.jenissampellosis});

  JenisSampelModel.fromJson(Map<String, dynamic> json) {
    kodelosis = json["KODE"];
    namasampellosis = json["SAMPEL_LOSIS"];
    jenissampellosis = json["JENIS_SAMPEL"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["kodeStasiun"] = kodeStasiun;
  //   return data;
  // }
  
  @override
  String toString() => jenissampellosis.toString();
}

class JenisSampelModelResponse {
  List<JenisSampelModel> sampellosisModel;
  String? message;

  JenisSampelModelResponse({required this.sampellosisModel, this.message});
}
