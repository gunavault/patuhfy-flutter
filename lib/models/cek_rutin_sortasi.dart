class CekRutinSortasiFormModel {
  String? rowstamp;
  String? pks;
  String? foto64;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? waktupengamatan;
  String? kebun;
  String? afdeling;
  String? blok;
  String? tahuntanam;
  String? nopolisi;
  String? jumlahtandandarikebun;
  String? jumlahtandanpks;
  String? selisihtandan;
  String? tbsmentah;
  String? tbsmatang;
  String? tbslewatmatang;
  String? tbskecil;
  String? tangkaipanjang;
  String? brondolan;

  CekRutinSortasiFormModel(
      {this.rowstamp,
      this.pks,
      this.foto64,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.waktupengamatan,
      this.kebun,
      this.afdeling,
      this.blok,
      this.tahuntanam,
      this.nopolisi,
      this.jumlahtandandarikebun,
      this.jumlahtandanpks,
      this.selisihtandan,
      this.tbsmentah,
      this.tbsmatang,
      this.tbslewatmatang,
      this.tbskecil,
      this.tangkaipanjang,
      this.brondolan});

  CekRutinSortasiFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    pks = json["PKS"];
    foto64 = json["FOTO"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
    waktupengamatan = json["WAKTU_PENGAMATAN"];
    kebun = json["KEBUN"];
    afdeling = json["AFDELING"];
    blok = json["BLOK"];
    tahuntanam = json["TAHUN_TANAM"];
    nopolisi = json["NO_POLISI"];
    jumlahtandandarikebun = json["JUMLAH_TANDAN_KEBUN"].toString();
    jumlahtandanpks = json["JUMLAH_TANDAN_PKS"].toString();
    selisihtandan = json["SELISIH_TANDAN"].toString();
    tbsmentah = json["TBS_MENTAH"].toString();
    tbsmatang = json["TBS_MATANG"].toString();
    tbslewatmatang = json["TBS_LEWAT_MATANG"].toString();
    tbskecil = json["TBS_KECIL_PROMOSI"].toString();
    tangkaipanjang = json["TANGKAI_PANJANG"].toString();
    brondolan = json["BRONDOLAN"].toString();
     }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PKS"] = pks;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["WAKTU_PENGAMATAN"] = waktupengamatan;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["KEBUN"] = kebun;
    data["AFDELING"] = afdeling;
    data["BLOK"] = blok;
    data["TAHUN_TANAM"] = tahuntanam;
    data["NO_POLISI"] = nopolisi;
    data["JUMLAH_TANDAN_KEBUN"] = jumlahtandandarikebun;
    data["JUMLAH_TANDAN_PKS"] = jumlahtandanpks;
    data["TBS_MENTAH"] = tbsmentah;
    data["TBS_MATANG"] = tbsmatang;
    data["TBS_LEWAT_MATANG"] = tbslewatmatang;
    data["TBS_KECIL_PROMOSI"] = tbskecil;
    data["TANGKAI_PANJANG"] = tangkaipanjang;
    data["BRONDOLAN"] = brondolan;
    data["FOTO"] = foto64;


    return data;
  }
}

class CekRutinSortasiFormModelResponse {
  final int status_code;
  final String message;
  final CekRutinSortasiFormModel? dataForm;

  CekRutinSortasiFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class CekRutinSortasiFormModelSelectResponse {
  final int status_code;
  final String message;
  final List<CekRutinSortasiFormModel> dataForm;

  CekRutinSortasiFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.dataForm});
}
