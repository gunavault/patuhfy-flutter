import 'package:floor/floor.dart';

@Entity(tableName: "m_blok", primaryKeys: ['id'])
class BlokModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? kodePsa;
  String? kodeAfd;
  String? kodeBlok;
  String? namaBlok;
  String? tahunTanam;
  String? luasArealTanam;

  BlokModel(
      {this.kodePsa,
      this.kodeAfd,
      this.kodeBlok,
      this.namaBlok,
      this.tahunTanam,
      this.luasArealTanam});

  BlokModel.fromJson(Map<String, dynamic> json) {
    kodePsa = json["unit_kerja"];
    kodeAfd = json["afdeling"];
    kodeBlok = json["kode_blok_sap"];
    namaBlok = json["nama_blok"];
    tahunTanam = json["tahun_tanam"];
    luasArealTanam = json["luas_tanam_ha"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["kodePsa"] = kodePsa;
    data["kodeAfd"] = kodeAfd;
    data["kodeBlok"] = kodeBlok;
    data["namaBlok"] = namaBlok;
    data["tahunTanam"] = tahunTanam;
    data["luas_tanam_ha"] = luasArealTanam;
    return data;
  }

  String userAsString() {
    return 'Kode AFD : $kodeBlok - $kodeAfd';
  }

  @override
  String toString() => kodeBlok.toString();
}

class BlokModelResponse {
  List<BlokModel>? blokModel;
  String? message;

  BlokModelResponse({this.blokModel, this.message});
}
