class KondisiPksModel {
  String? kodeKondisiPks;
  String? namaKondisiPks;

  KondisiPksModel({this.kodeKondisiPks, this.namaKondisiPks});

  KondisiPksModel.fromJson(Map<String, dynamic> json) {
    kodeKondisiPks = json["KODE"];
    namaKondisiPks = json["KONDISI_PKS"];
  }

  @override
  String toString() => namaKondisiPks.toString();
}

class KondisiPksModelResponse {
  List<KondisiPksModel> kondisiPksModel;
  String? message;

  KondisiPksModelResponse({required this.kondisiPksModel, this.message});
}
