class SampelLosisModel {
  String? kodelosis;
  String? namasampellosis;

  SampelLosisModel({this.kodelosis, this.namasampellosis});

  SampelLosisModel.fromJson(Map<String, dynamic> json) {
    kodelosis = json["KODE"];
    namasampellosis = json["SAMPEL_LOSIS"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["kodeStasiun"] = kodeStasiun;
  //   return data;
  // }

  @override
  String toString() => namasampellosis.toString();
}

class SampelLosisModelResponse {
  List<SampelLosisModel> sampellosisModel;
  String? message;

  SampelLosisModelResponse({required this.sampellosisModel, this.message});
}
