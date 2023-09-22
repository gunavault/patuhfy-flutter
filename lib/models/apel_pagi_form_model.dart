import 'package:floor/floor.dart';

@Entity(tableName: "t_apel_pagi")
class ApelPagiFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? company;
  String? unitKerja;
  String? afd;
  String? foto;
  String? createdBy;
  String? long;
  String? lat;

  ApelPagiFormModel(
      {this.tanggal,
      this.company,
      this.unitKerja,
      required this.afd,
      required this.foto,
      this.createdBy,
      this.long,
      this.lat});

  ApelPagiFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    tanggal = json['data']["tanggal"];
    company = json['data']["company"];
    unitKerja = json['data']["unitKerja"];
    afd = json['data']["afd"];
    foto = json['data']["foto"];
    createdBy = json['data']["createdBy"];
    long = json['data']["long"];
    lat = json['data']["lat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tanggal"] = tanggal;
    data["company"] = company;
    data["unitKerja"] = unitKerja;
    data["afd"] = afd;
    data["foto"] = foto;
    data["createdBy"] = createdBy;
    data["foto"] = foto;
    data["long"] = long;
    data["lat"] = lat;

    return data;
  }
}

class ApelPagiFormModelResponse {
  final int status_code;
  final String message;

  ApelPagiFormModelResponse({required this.status_code, required this.message});
}
