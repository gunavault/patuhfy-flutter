import 'package:floor/floor.dart';

@Entity(tableName: "t_apel_pagi_pengolahan", primaryKeys: ['id'])
class ApelPagiPengolahanFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? rowstamp;
  String? tanggal;
  String? unitKerja;
  String? jenisApel;
  String? jamMulai;
  String? jamSelesai;
  double? latMulai;
  double? longMulai;
  double? latSelesai;
  double? longSelesai;
  String? keterangan;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? foto;
  int? isSend;

  ApelPagiPengolahanFormModel(
      {this.id,
      this.rowstamp,
      this.tanggal,
      this.unitKerja,
      this.jenisApel,
      this.jamMulai,
      this.jamSelesai,
      this.latMulai,
      this.longMulai,
      this.latSelesai,
      this.longSelesai,
      this.keterangan,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.foto,
      this.isSend});

  ApelPagiPengolahanFormModel.fromJson(Map<String, dynamic> json) {
    rowstamp = json['ROWSTAMP'];
    tanggal = json['TANGGAL'];
    unitKerja = json['UNIT_KERJA'];
    jenisApel = json['JENIS_APEL'];
    jamMulai = json['JAM_MULAI'];
    jamSelesai = json['JAM_SELESAI'];
    latMulai = json['LAT_MULAI'].toDouble();
    longMulai = json['LONG_MULAI'].toDouble();
    latSelesai = json['LAT_SELESAI'].toDouble();
    longSelesai = json['LONG_SELESAI'].toDouble();
    keterangan = json['KETERANGAN'];
    createdBy = json['CREATED_BY'];
    createdAt = json['CREATED_AT'];
    updatedBy = json['UPDATED_BY'];
    updatedAt = json['UPDATED_AT'];
    foto = json['FOTO'];
    isSend = 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'ROWSTAMP': rowstamp,
      'TANGGAL': tanggal,
      'UNIT_KERJA': unitKerja,
      'JENIS_APEL': jenisApel,
      'JAM_MULAI': jamMulai,
      'JAM_SELESAI': jamSelesai,
      'LAT_MULAI': latMulai,
      'LONG_MULAI': longMulai,
      'LAT_SELESAI': latSelesai,
      'LONG_SELESAI': longSelesai,
      'KETERANGAN': keterangan,
      'CREATED_BY': createdBy,
      'CREATED_AT': createdAt,
      'UPDATED_BY': updatedBy,
      'UPDATED_AT': updatedAt,
    };
  }
}

class ApelPagiPengolahanFormModelResponse {
  final int status_code;
  final String message;
  final ApelPagiPengolahanFormModel? dataForm;

  ApelPagiPengolahanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class ApelPagiPengolahanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<ApelPagiPengolahanFormModel> dataForm;

  ApelPagiPengolahanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
