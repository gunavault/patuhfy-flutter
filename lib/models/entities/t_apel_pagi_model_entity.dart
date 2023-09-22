// import 'package:floor/floor.dart';

// @Entity(tableName: "t_apel_pagi")
// class TApelPagiEntity {
//   @PrimaryKey(autoGenerate: true)
//   int? id;
//   String? tanggal;
//   String? company;
//   String? unitKerja;
//   String? afd;
//   String? foto;
//   String? createdBy;
//   String? long;
//   String? lat;

//   TApelPagiEntity(
//       {this.id,
//       required this.tanggal,
//       required this.company,
//       required this.unitKerja,
//       required this.afd,
//       required this.foto,
//       required this.createdBy,
//       required this.long,
//       required this.lat});

//   TApelPagiEntity.fromJson(Map<String, dynamic> json) {
//     // print('afd ga ${json["afdeling"]}');
//     tanggal = json['data']["tanggal"];
//     company = json['data']["company"];
//     unitKerja = json['data']["unitKerja"];
//     afd = json['data']["afd"];
//     foto = json['data']["foto"];
//     createdBy = json['data']["createdBy"];
//     long = json['data']["long"];
//     lat = json['data']["lat"];
//   }
// }

// class TApelPagiEntityResponse {
//   List<TApelPagiEntity>? data;
//   String? message;

//   TApelPagiEntityResponse({this.data, this.message});
// }
