class JenisKebersihanModel {
  String? kodeJenisKebersihan;
  String? namaJenisKebersihan;

  JenisKebersihanModel({this.kodeJenisKebersihan, this.namaJenisKebersihan});

  JenisKebersihanModel.fromJson(Map<String, dynamic> json) {
    kodeJenisKebersihan = json["KODE"];
    kodeJenisKebersihan = json["JENIS_KEBERSIHAN"];
  }

  @override
  String toString() => kodeJenisKebersihan.toString();
}

class JenisKebersihanModelResponse {
  List<JenisKebersihanModel> jenisKebersihanModel;
  String? message;

  JenisKebersihanModelResponse(
      {required this.jenisKebersihanModel, this.message});
}
