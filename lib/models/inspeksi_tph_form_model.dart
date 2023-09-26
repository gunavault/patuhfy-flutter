import 'package:floor/floor.dart';

@Entity(tableName: "t_inspeksi_tph")
class InspeksiTphFormModel {
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
  int? noTph;
  int? panenBuahSangatMentah;
  int? tbsBusuk;
  int? gagangTandanPanjang;
  int? tbsTidakDiberiNomor;
  int? tbsTidakDisusunRapi;
  int? tangkaiTidakBerbentukV;
  String? createdBy;
  String? long;
  String? lat;

  InspeksiTphFormModel(
      {this.tanggal,
      this.company,
      this.unitKerja,
      this.afd,
      this.blok,
      this.tahunTanam,
      this.kapveld,
      this.mandor,
      this.pemanen,
      this.noTph,
      this.panenBuahSangatMentah,
      this.tbsBusuk,
      this.gagangTandanPanjang,
      this.tbsTidakDiberiNomor,
      this.tbsTidakDisusunRapi,
      this.tangkaiTidakBerbentukV,
      this.createdBy,
      this.long,
      this.lat});

  InspeksiTphFormModel.fromJson(Map<String, dynamic> json) {
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
    noTph = json["NO_TPH"];
    panenBuahSangatMentah = json["PANEN_BUAH_SANGAT_MENTAH"];
    tbsBusuk = json["TBS_BUSUK"];
    gagangTandanPanjang = json["GAGANG_TANDAN_PANJANG"];
    tbsTidakDiberiNomor = json["TBS_TIDAK_DIBERI_NOMOR"];
    tbsTidakDisusunRapi = json["TBS_TIDAK_DISUSUN_RAPI"];
    tangkaiTidakBerbentukV = json["TANGKAI_TIDAK_BERBENTUK_V"];
    createdBy = json["CREATED_BY"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
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
    data["PANEN_BUAH_SANGAT_MENTAH"] = panenBuahSangatMentah;
    data["TBS_BUSUK"] = tbsBusuk;
    data["GAGANG_TANDAN_PANJANG"] = gagangTandanPanjang;
    data["TBS_TIDAK_DIBERI_NOMOR"] = tbsTidakDiberiNomor;
    data["TBS_TIDAK_DISUSUN_RAPI"] = tbsTidakDisusunRapi;
    data["TANGKAI_TIDAK_BERBENTUK_V"] = tangkaiTidakBerbentukV;
    data["CREATED_BY"] = createdBy;
    data["LAT"] = lat;
    data["LONG"] = long;

    return data;
  }
}

class InspeksiTphFormModelResponse {
  final int status_code;
  final String message;
  final InspeksiTphFormModel? dataForm;

  InspeksiTphFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class InspeksiTphFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<InspeksiTphFormModel> dataForm;

  InspeksiTphFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
