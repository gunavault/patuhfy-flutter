import 'package:floor/floor.dart';

@Entity(tableName: "m_blok")
class BlokModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? kodePsa;
  String? kodeAfd;
  String? kodeBlok;
  String? namaBlok;
  String? tahunTanam;

  BlokModel(
      {this.kodePsa,
      this.kodeAfd,
      this.kodeBlok,
      this.namaBlok,
      this.tahunTanam});

  BlokModel.fromJson(Map<String, dynamic> json) {
    this.kodePsa = json["unit_kerja"];
    this.kodeAfd = json["afdeling"];
    this.kodeBlok = json["kode_blok_sap"];
    this.namaBlok = json["nama_blok"];
    this.tahunTanam = json["tahun_tanam"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["kodePsa"] = kodePsa;
    data["kodeAfd"] = kodeAfd;
    data["kodeBlok"] = kodeBlok;
    data["namaBlok"] = namaBlok;
    data["tahunTanam"] = tahunTanam;
    return data;
  }

  @override
  String toString() => kodeBlok.toString();
}

class BlokModelResponse {
  List<BlokModel>? blokModel;
  String? message;

  BlokModelResponse({this.blokModel, this.message});
}
