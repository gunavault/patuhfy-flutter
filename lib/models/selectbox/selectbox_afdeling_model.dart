class SelectboxAfdelingModel {
  String kodeAfd = '';

  SelectboxAfdelingModel({required this.kodeAfd});

  SelectboxAfdelingModel.fromJson(Map<String, dynamic> json) {
    this.kodeAfd = json["afdeling"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["kodeAfd"] = kodeAfd;
    return data;
  }
}
