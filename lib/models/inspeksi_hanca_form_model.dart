import 'package:floor/floor.dart';

@Entity(tableName: "t_inspeksi_hanca")
class InspeksiHancaFormModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? tanggal;
  String? company;
  String? unitKerja;
  String? afd;
  String? foto;
  String? blok;
  int? tahunTanam;
  int? kapveld;
  String? mandor;
  String? pemanen;
  int? brondolanTidakDikutip;
  int? buahBusuk;
  int? buahLewatMarangTidakDipanen;
  int? buahLewatMatangTidakDiangkutKeTph;
  int? pelepahTidakDipotongTiga;
  int? pelepahTidakDiturunkan;
  String? createdBy;
  String? long;
  String? lat;

  InspeksiHancaFormModel(
      {this.tanggal,
      this.company,
      this.unitKerja,
      this.afd,
      this.blok,
      this.tahunTanam,
      this.kapveld,
      this.mandor,
      this.pemanen,
      this.brondolanTidakDikutip,
      this.buahBusuk,
      this.buahLewatMarangTidakDipanen,
      this.buahLewatMatangTidakDiangkutKeTph,
      this.pelepahTidakDipotongTiga,
      this.pelepahTidakDiturunkan,
      this.createdBy,
      this.long,
      this.lat});

  InspeksiHancaFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    tanggal = json["TANGGAL"];
    company = json["COMPANY"];
    unitKerja = json["UNIT_KERJA"];
    afd = json["AFDELING"];
    blok = json["BLOK"];
    tahunTanam = json["TAHUN_TANAM"];
    kapveld = json["KAPVELD"];
    mandor = json["MANDOR"];
    pemanen = json["PEMANEN"];
    brondolanTidakDikutip = json["BRONDOLAN_TIDAK_DIKUTIP"];
    buahBusuk = json["BUAH_BUSUK"];
    buahLewatMarangTidakDipanen = json["BUAH_LEWAT_MATANG_TIDAK_DIPANEN"];
    buahLewatMatangTidakDiangkutKeTph =
        json["BUAH_LEWAT_MATANG_TIDAK_DIANGKUT_KE_TPH"];
    pelepahTidakDipotongTiga = json["PELEPAH_TIDAK_DIPOTONG_TIGA"];
    pelepahTidakDiturunkan = json["PELEPAH_TIDAK_DITURUNKAN"];
    createdBy = json["CREATED_BY"];
    long = json["LAT"];
    lat = json["LONG"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TANGGAL"] = tanggal;
    data["COMPANY"] = company;
    data["UNIT_KERJA"] = unitKerja;
    data["AFDELING"] = afd;
    data["BLOK"] = blok;
    data["TAHUN_TANAM"] = tahunTanam;
    data["KAPVELD"] = kapveld;
    data["MANDOR"] = mandor;
    data["PEMANEN"] = pemanen;
    data["BRONDOLAN_TIDAK_DIKUTIP"] = brondolanTidakDikutip;
    data["BUAH_BUSUK"] = buahBusuk;
    data["BUAH_LEWAT_MATANG_TIDAK_DIPANEN"] = buahLewatMarangTidakDipanen;
    data["BUAH_LEWAT_MATANG_TIDAK_DIANGKUT_KE_TPH"] =
        buahLewatMatangTidakDiangkutKeTph;
    data["PELEPAH_TIDAK_DIPOTONG_TIGA"] = pelepahTidakDipotongTiga;
    data["PELEPAH_TIDAK_DITURUNKAN"] = pelepahTidakDiturunkan;
    data["CREATED_BY"] = createdBy;
    data["LAT"] = long;
    data["LONG"] = lat;

    return data;
  }
}

class InspeksiHancaFormModelResponse {
  final int status_code;
  final String message;
  final InspeksiHancaFormModel? dataForm;

  InspeksiHancaFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class InspeksiHancaFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<InspeksiHancaFormModel> dataForm;

  InspeksiHancaFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
