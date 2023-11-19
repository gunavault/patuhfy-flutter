class KondisiProsesModel {
  String? kodeKondisiProses;
  String? namaKondisiProses;

  KondisiProsesModel({this.kodeKondisiProses, this.namaKondisiProses});

  KondisiProsesModel.fromJson(Map<String, dynamic> json) {
    kodeKondisiProses = json["KODE"];
    namaKondisiProses = json["NAMA"];
  }

  @override
  String toString() => namaKondisiProses.toString();
}

class KondisiProsesModelResponse {
  List<KondisiProsesModel> kondisiProsesModel;
  String? message;

  KondisiProsesModelResponse({required this.kondisiProsesModel, this.message});
}
