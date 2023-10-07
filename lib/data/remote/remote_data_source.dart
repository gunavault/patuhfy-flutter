import 'package:dio/dio.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/mandor_model.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

class RemoteDataSource {
  static final RemoteDataSource _singleton = RemoteDataSource._internal();

  factory RemoteDataSource() {
    return _singleton;
  }

  RemoteDataSource._internal();

  optionAuth(token) {
    return Options(headers: {"Authorization": "Bearer $token"});
  }

  Future<UserModelResponse> login(nikSap, password) async {
    try {
      var dio = Dio();
      var response = await dio.post("$baseUrl/login",
          data: {"nik_sap": nikSap, "password": password});
      return UserModelResponse(userModel: UserModel.fromJson(response.data));
    } on DioError catch (err) {
      return UserModelResponse(message: err.response.toString());
    }
  }

  Future getAfdelingData(kodePsa, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-afd-by-psa?psa=$kodePsa",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return AfdelingModelResponse(
          afdelingModel: parsedData
              .map((value) => AfdelingModel.fromJson(value))
              .toList());
    } on DioError {
      return [];
      // return err.response.toString();
    }
  }

  Future getBlokData(String kodePsa, String company, String token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-blok-by-psa?psa=$kodePsa&&company=$company",
          options: optionAuth(token));
      print('data blok nih ${response.data['data']}');
      List<dynamic> parsedData = response.data['data'];
      return BlokModelResponse(
          blokModel:
              parsedData.map((value) => BlokModel.fromJson(value)).toList());
    } on DioError {
      return [];
      // return err.response.toString();
    }
  }

  getMandorByPsa(String kodePsa, String token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-mandor-by-psa?psa=$kodePsa",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return MandorModelResponse(
          mandorModel:
              parsedData.map((value) => MandorModel.fromJson(value)).toList());
    } on DioError {
      return [];
      // return err.response.toString();
    }
  }

  Future getPemanenByPsa(String kodePsa, String token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-pemanen-by-psa?psa=$kodePsa",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return PemanenModelResponse(
          pemanenModel:
              parsedData.map((value) => PemanenModel.fromJson(value)).toList());
    } on DioError {
      return [];
      // return err.response.toString();
    }
  }

  createApelPagi(token, ApelPagiFormModel dataForm) async {
    try {
      var dio = Dio();

      var response = await dio.post("$baseUrl/tasksheet/apel-pagi",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return ApelPagiFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return ApelPagiFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<ApelPagiFormModelSelectResponse> getDataApelPagiByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      print(
          'cek apel pagi $baseUrl/tasksheet/apel-pagi/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy');
      var response = await dio.get(
          "$baseUrl/tasksheet/apel-pagi/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return ApelPagiFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => ApelPagiFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return ApelPagiFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [ApelPagiFormModel(afd: '', foto: '')]);
    }
  }

  // InspeksiHanca
  Future<InspeksiHancaFormModelResponse> createInspeksiHanca(
      token, InspeksiHancaFormModel dataForm) async {
    try {
      var dio = Dio();

      var response = await dio.post("$baseUrl/tasksheet/inspeksi-hanca",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return InspeksiHancaFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return InspeksiHancaFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<InspeksiHancaFormModelSelectResponse> getDataInspeksiHancaByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/inspeksi-hanca/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return InspeksiHancaFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => InspeksiHancaFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return InspeksiHancaFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [InspeksiHancaFormModel()]);
    }
  }

  // Inspeksi TPH
  Future<InspeksiTphFormModelResponse> createInspeksiTph(
      token, InspeksiTphFormModel dataForm) async {
    try {
      var dio = Dio();
      print('url nya ke sini $baseUrl/tasksheet/inspeksi-tph');

      print('data yang dikirim aap ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/tasksheet/inspeksi-tph",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return InspeksiTphFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return InspeksiTphFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<InspeksiTphFormModelSelectResponse> getDataInspeksiTphByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/inspeksi-tph/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return InspeksiTphFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => InspeksiTphFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return InspeksiTphFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [InspeksiTphFormModel()]);
    }
  }

  //  Pencurian TBS
  Future<PencurianTbsFormModelResponse> createPencurianTbs(
      token, PencurianTbsFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data Json tbs ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/tasksheet/pencurian-tbs",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      print('callback $callback');
      return PencurianTbsFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('error apa $err');
      return PencurianTbsFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<PencurianTbsFormModelSelectResponse> getDataPencurianTbsByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/pencurian-tbs/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return PencurianTbsFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => PencurianTbsFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return PencurianTbsFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [PencurianTbsFormModel()]);
    }
  }

  //Laporan Kerusakan
  Future<LapKerusakanFormModelResponse> createLapKerusakan(
      token, LapKerusakanFormModel dataForm) async {
    try {
      var dio = Dio();

      var response = await dio.post("$baseUrl/tasksheet/lap-kerusakan",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return LapKerusakanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return LapKerusakanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<LapKerusakanFormModelSelectResponse> getDataLapKerusakanByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/lap-kerusakan/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return LapKerusakanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => LapKerusakanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return LapKerusakanFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [LapKerusakanFormModel()]);
    }
  }

  //Realisasi Pemupukan
  Future<RealPemupukanFormModelResponse> createRealPemupukan(
      token, RealPemupukanFormModel dataForm) async {
    try {
      var dio = Dio();
      print('apa ini data pemupukan ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/tasksheet/real-pemupukan",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RealPemupukanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealPemupukanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealPemupukanFormModelSelectResponse> getDataRealPemupukanByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-pemupukan/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return RealPemupukanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealPemupukanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealPemupukanFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealPemupukanFormModel()]);
    }
  }

  // RTL LIST

  Future<RtlListModelSelectResponse> getDataListRtlByPsaAndKodeJabatan(
      psa, nik_sap, status, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/rtl/get-rtl-by-psa-jabatan-submitter?psa=$psa&nik_sap=$nik_sap&status=$status",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('parsedData ${callback['status_code']}');

      return RtlListModelSelectResponse(
          status_code: callback['status_code'],
          message: callback['msg'],
          dataForm:
              parsedData.map((value) => RtlListModel.fromJson(value)).toList());
    } on DioError catch (err) {
      return RtlListModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RtlListModel()]);
    }
  }
}
