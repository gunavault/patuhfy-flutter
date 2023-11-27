class ApelPengolahanFormModel {
  String? rowstamp;
  String? pks;
  String? foto;
  String? long;
  String? lat;
  String? mobile_created_at;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? jenisApel;
  String? keterangan;

  ApelPengolahanFormModel(
      {this.rowstamp,
      this.pks,
      this.foto,
      this.long,
      this.lat,
      this.mobile_created_at,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.jenisApel,
      this.keterangan});

  ApelPengolahanFormModel.fromJson(Map<String, dynamic> json) {
    // print('afd ga ${json["afdeling"]}');
    rowstamp = json["ROWSTAMP"];
    pks = json["PKS"];
    foto = json["FOTO"];
    long = json["LONG"].toString();
    lat = json["LAT"].toString();
    mobile_created_at = json["MOBILE_CREATED_AT"];
    createdBy = json["CREATED_BY"];
    updatedAt = json["UPDATED_AT"];
    updatedBy = json["UPDATED_BY"];
    jenisApel = json["JENIS_APEL"];
    keterangan = json["KETERANGAN"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PKS"] = pks;
    data["MOBILE_CREATED_AT"] = mobile_created_at;
    data["CREATED_BY"] = createdBy;
    data["LONG"] = long;
    data["LAT"] = lat;
    data["FOTO"] = foto;
    data["JENIS_APEL"] = jenisApel;
    data["UPDATED_AT"] = updatedAt;
    data["UPDATED_BY"] = updatedBy;
    data["KETERANGAN"] = keterangan;

    return data;
  }
}

class ApelPengolahanFormModelResponse {
  final int status_code;
  final String message;
  final ApelPengolahanFormModel? dataForm;

  ApelPengolahanFormModelResponse(
      {required this.status_code, required this.message, this.dataForm});
}

class ApelPengolahanFormModelSelectResponse {
  final int status_code;
  final String message;
  final bool isCheckout;
  final List<ApelPengolahanFormModel> dataForm;

  ApelPengolahanFormModelSelectResponse(
      {required this.status_code,
      required this.message,
      required this.isCheckout,
      required this.dataForm});
}

class ApelPengolahanFormUpdateModel {
  final String rowstamp;

  ApelPengolahanFormUpdateModel({required this.rowstamp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ROWSTAMP"] = rowstamp;

    return data;
  }
}

class ApelPengolahanFormUpdateModelResponse {
  final int status_code;
  final String message;
  final bool isCheckout;
  final List<ApelPengolahanFormModel> dataForm;

  ApelPengolahanFormUpdateModelResponse({
    required this.status_code,
    required this.message,
    required this.isCheckout,
    required this.dataForm,
  });
}
