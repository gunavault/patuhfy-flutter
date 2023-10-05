import 'package:floor/floor.dart';

@Entity(tableName: "t_real_restan")
class RealRestanFormModel {
  String? rOWSTAMP;
  String? tANGGAL;
  String? uNITKERJA;
  String? aFDELING;
  String? bLOK;
  int? tAHUNTANAM;
  int? rOTASIPANEN;
  int? nORMAPUSINGAN;
  int? pUSINGAN9HARI;
  int? pUSINGAN10HARI;
  int? pUSINGAN11HARI;
  int? pUSINGAN12HARILEBIH;
  String? pENYEBAB;
  String? rTL;
  int? lAT;
  int? lONG;
  String? mOBILECREATEDAT;
  String? cREATEDBY;

  RealRestanFormModel(
      {this.rOWSTAMP,
      this.tANGGAL,
      this.uNITKERJA,
      this.aFDELING,
      this.bLOK,
      this.tAHUNTANAM,
      this.rOTASIPANEN,
      this.nORMAPUSINGAN,
      this.pUSINGAN9HARI,
      this.pUSINGAN10HARI,
      this.pUSINGAN11HARI,
      this.pUSINGAN12HARILEBIH,
      this.pENYEBAB,
      this.rTL,
      this.lAT,
      this.lONG,
      this.mOBILECREATEDAT,
      this.cREATEDBY});

  RealRestanFormModel.fromJson(Map<String, dynamic> json) {
    rOWSTAMP = json['ROWSTAMP'];
    tANGGAL = json['TANGGAL'];
    uNITKERJA = json['UNIT_KERJA'];
    aFDELING = json['AFDELING'];
    bLOK = json['BLOK'];
    tAHUNTANAM = json['TAHUN_TANAM'];
    rOTASIPANEN = json['ROTASI_PANEN'];
    nORMAPUSINGAN = json['NORMA_PUSINGAN'];
    pUSINGAN9HARI = json['PUSINGAN_9_HARI'];
    pUSINGAN10HARI = json['PUSINGAN_10_HARI'];
    pUSINGAN11HARI = json['PUSINGAN_11_HARI'];
    pUSINGAN12HARILEBIH = json['PUSINGAN_12_HARI_LEBIH'];
    pENYEBAB = json['PENYEBAB'];
    rTL = json['RTL'];
    lAT = json['LAT'];
    lONG = json['LONG'];
    mOBILECREATEDAT = json['MOBILE_CREATED_AT'];
    cREATEDBY = json['CREATED_BY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ROWSTAMP'] = rOWSTAMP;
    data['TANGGAL'] = tANGGAL;
    data['UNIT_KERJA'] = uNITKERJA;
    data['AFDELING'] = aFDELING;
    data['BLOK'] = bLOK;
    data['TAHUN_TANAM'] = tAHUNTANAM;
    data['ROTASI_PANEN'] = rOTASIPANEN;
    data['NORMA_PUSINGAN'] = nORMAPUSINGAN;
    data['PUSINGAN_9_HARI'] = pUSINGAN9HARI;
    data['PUSINGAN_10_HARI'] = pUSINGAN10HARI;
    data['PUSINGAN_11_HARI'] = pUSINGAN11HARI;
    data['PUSINGAN_12_HARI_LEBIH'] = pUSINGAN12HARILEBIH;
    data['PENYEBAB'] = pENYEBAB;
    data['RTL'] = rTL;
    data['LAT'] = lAT;
    data['LONG'] = lONG;
    data['MOBILE_CREATED_AT'] = mOBILECREATEDAT;
    data['CREATED_BY'] = cREATEDBY;
    return data;
  }
}

class LapKerusakanFormModelResponse {
  final int status_code;
  final String message;
  final RealRestanFormModel? dataForm;

  LapKerusakanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class LapKerusakanFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<RealRestanFormModel> dataForm;

  LapKerusakanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
