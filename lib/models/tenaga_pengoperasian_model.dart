class TenagaPengoperasianModel {
  String? kodeTenagaPengoperasian;
  String? namaTenagaPengoperasian;

  TenagaPengoperasianModel(
      {this.kodeTenagaPengoperasian, this.namaTenagaPengoperasian});

  TenagaPengoperasianModel.fromJson(Map<String, dynamic> json) {
    kodeTenagaPengoperasian = json["KODE"];
    namaTenagaPengoperasian = json["NAMA"];
  }

  @override
  String toString() => namaTenagaPengoperasian.toString();
}

class TenagaPengoperasianModelResponse {
  List<TenagaPengoperasianModel> tenagaPengoperasianModel;
  String? message;

  TenagaPengoperasianModelResponse(
      {required this.tenagaPengoperasianModel, this.message});
}
