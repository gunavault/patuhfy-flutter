import 'package:dio/dio.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/alat_by_stasiun_model.dart';
import 'package:patuhfy/models/analisa_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/apel_pengolahan_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_rutin_sortasi.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/jenis_kebersihan_model.dart';
import 'package:patuhfy/models/jenis_kerusakan_model.dart';
import 'package:patuhfy/models/kondisi_pks_model.dart';
import 'package:patuhfy/models/kebun_model.dart';
import 'package:patuhfy/models/kondisi_proses_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/m_jenis_losis_model.dart';
import 'package:patuhfy/models/m_sampel_losis_model.dart';
import 'package:patuhfy/models/mandor_model.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/penyelesaian_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/peroftma_model.dart';
import 'package:patuhfy/models/proses_pengolahan_form_model.dart';
import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';
import 'package:patuhfy/models/real_penunasan_form_model.dart';
import 'package:patuhfy/models/real_penyiangan_form_model.dart';
import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';
import 'package:patuhfy/models/real_restan_form_model.dart';
import 'package:patuhfy/models/rtl_detail_form_model.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_detail_update_status_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/rtl_update_status_model.dart';
import 'package:patuhfy/models/stasiun_model.dart';
import 'package:patuhfy/models/tenaga_pengoperasian_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/models/waktu_pengamatan_model.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
// import 'package:patuhfy/models/cek_sampel_Losis_Model.dart';

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
      List<dynamic> parsedData = response.data['data'];
      return BlokModelResponse(
          blokModel:
              parsedData.map((value) => BlokModel.fromJson(value)).toList());
    } on DioError {
      return [];
      // return err.response.toString();
    }
  }

  Future getBlokDataAfd(
      String kodePsa, String company, String afd, String token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-blok-by-psa-afd?psa=$kodePsa&company=$company&afd=$afd",
          options: optionAuth(token));
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
      print('callaback $callback');
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

  //Realisasi pengendalian hama
  Future<RealPengendalianHamaFormModelResponse> createRealPengendalianHama(
      token, RealPengendalianHamaFormModel dataForm) async {
    try {
      var dio = Dio();
      var response = await dio.post("$baseUrl/tasksheet/real-pengendalian-hama",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RealPengendalianHamaFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealPengendalianHamaFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealPengendalianHamaFormModelSelectResponse>
      getDataRealPengendalianHamaByTanggal(tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-pengendalian-hama/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('callaback $callback');
      return RealPengendalianHamaFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealPengendalianHamaFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealPengendalianHamaFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealPengendalianHamaFormModel()]);
    }
  }

  //Realisasi Penyiangan
  Future<RealPenyianganFormModelResponse> createRealPenyiangan(
      token, RealPenyianganFormModel dataForm) async {
    try {
      var dio = Dio();
      print('apa ini data penyiangan ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/tasksheet/real-penyiangan",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RealPenyianganFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealPenyianganFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealPenyianganFormModelSelectResponse> getDataRealPenyianganByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-penyiangan/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return RealPenyianganFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealPenyianganFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealPenyianganFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealPenyianganFormModel()]);
    }
  }

//Realisasi Pusingan Panen
  Future<RealPusinganPanenFormModelResponse> createRealPusinganPanen(
      token, RealPusinganPanenFormModel dataForm) async {
    try {
      var dio = Dio();
      var response = await dio.post("$baseUrl/tasksheet/real-pusingan-panen",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RealPusinganPanenFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealPusinganPanenFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealPusinganPanenFormModelSelectResponse>
      getDataRealPusinganPanenByTanggal(tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-pusingan-panen/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return RealPusinganPanenFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealPusinganPanenFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealPusinganPanenFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealPusinganPanenFormModel()]);
    }
  }

  //Realisasi Penunasan
  Future<RealPenunasanFormModelResponse> createRealPenunasan(
      token, RealPenunasanFormModel dataForm) async {
    try {
      var dio = Dio();
      var response = await dio.post("$baseUrl/tasksheet/real-penunasan",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RealPenunasanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealPenunasanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealPenunasanFormModelSelectResponse> getDataRealPenunasanByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-penunasan/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return RealPenunasanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealPenunasanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealPenunasanFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealPenunasanFormModel()]);
    }
  }

  //Realisasi Restan
  Future<RealRestanFormModelResponse> createRealRestan(
      token, RealRestanFormModel dataForm) async {
    try {
      var dio = Dio();
      print('apa ini data restan ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/tasksheet/real-restan",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RealRestanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealRestanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealRestanFormModelSelectResponse> getDataRealRestanByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-restan/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return RealRestanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealRestanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealRestanFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealRestanFormModel()]);
    }
  }

  //Realisasi Pemeliharaan Jalan
  Future<RealPemeliharaanJalanFormModelResponse> createRealPemeliharaanJalan(
      token, RealPemeliharaanJalanFormModel dataForm) async {
    try {
      var dio = Dio();
      print('apa ini data restan ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet/real-pemeliharaan-jalan",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return RealPemeliharaanJalanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return RealPemeliharaanJalanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<RealPemeliharaanJalanFormModelSelectResponse>
      getDataRealPemeliharaanJalanByTanggal(tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/real-pemeliharaan-jalan/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('awwwww $parsedData');
      return RealPemeliharaanJalanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RealPemeliharaanJalanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RealPemeliharaanJalanFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RealPemeliharaanJalanFormModel()]);
    }
  }

  // RTL LIST
  Future<RtlListModelSelectResponse> getDataListRtlByPsaAndKodeJabatan(
      psa, nikSap, status, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/rtl/get-rtl-by-psa-jabatan-submitter?psa=$psa&nik_sap=$nikSap&status=$status",
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

  Future<RtlListModelSelectResponse> getDataListRtlByPsa(
      psa, nikSap, status, role, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/rtl/get-rtl-by-psa?psa=$psa&nik_sap=$nikSap&status=$status&role=$role",
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

  Future<RtlDetailFormModelResponse> createRtlDetail(
      token, RtlDetailFormModel dataForm) async {
    try {
      var dio = Dio();
      print('cek data sblm dikirim ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/rtl/insert-detail",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RtlDetailFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('aww error $err');
      return RtlDetailFormModelResponse(message: 'error', status_code: 500);
    }
  }

  Future<RtlDetailListModelSelectResponse> getDataListRtlDetailByRowstampAcuan(
      rowstampAcuan, token) async {
    try {
      var dio = Dio();
      print('adas rowstamp $rowstampAcuan');
      var response = await dio.get(
          "$baseUrl/rtl/get-rtl-detail-by-rowstamp-acuan?ROWSTAMP_ACUAN=$rowstampAcuan",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('parsedDataerdrtr ${callback}');

      return RtlDetailListModelSelectResponse(
          status_code: callback['status_code'],
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => RtlDetailListModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return RtlDetailListModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [RtlDetailListModel()]);
    }
  }
  Future<AnalisaKerusakanAlatListModelSelectResponse> getDataListAnalisaKerusakanAlatByRowstampAcuan(
      rowstampAcuan, token) async {
    try {
      var dio = Dio();
      print('adas rowasdstamp $rowstampAcuan');
      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/analisa-kerusakan/get-data-by-rowstamp?ROWSTAMP_ACUAN=$rowstampAcuan",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('parsedDdsfdsata ${callback['status_code']}');

      return AnalisaKerusakanAlatListModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => AnalisaKerusakanAlatModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      
      return AnalisaKerusakanAlatListModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [AnalisaKerusakanAlatModel()]);
    }
  }
  Future<PenyelesaianKerusakanAlatListModelSelectResponse> getDataListPenyelesaianKerusakanAlatByRowstampAcuan(
      rowstampAcuan, token) async {
    try {
      var dio = Dio();
      print('adas rowasdstamp $rowstampAcuan');
      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/Penyelesaian-kerusakan/get-data-by-rowstamp?ROWSTAMP_ACUAN=$rowstampAcuan",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('parsedDdsfdsata ${callback['status_code']}');

      return PenyelesaianKerusakanAlatListModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => PenyelesaianKerusakanAlatModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      
      return PenyelesaianKerusakanAlatListModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [PenyelesaianKerusakanAlatModel()]);
    }
  }

  Future<AnalisaKerusakanAlatModelResponse> createAnalisaKerusakanAlat(
      token, AnalisaKerusakanAlatModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/analisa-kerusakan",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return AnalisaKerusakanAlatModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return AnalisaKerusakanAlatModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }
  
    Future<PenyelesaianKerusakanAlatModelResponse> createPenyelesaianKerusakanAlat(
      token, PenyelesaianKerusakanAlatModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/penyelesaian-kerusakan",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return PenyelesaianKerusakanAlatModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return PenyelesaianKerusakanAlatModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }


  Future<RtlUpdateStatusFormModelResponse> updateStatusRtl(
      token, RtlUpdateStatusFormModel dataForm) async {
    try {
      var dio = Dio();
      print('cek data sblm dikirim ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/rtl/update-status-rtl",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RtlUpdateStatusFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          rowstamp: dataForm.rowstamp,
          rtlData: RtlListModel.fromJson(callback['data']));
    } on DioError catch (err) {
      print('aww error $err');
      return RtlUpdateStatusFormModelResponse(
          message: 'error', status_code: 500, rtlData: RtlListModel());
    }
  }

  Future<RtlDetailUpdateStatusFormModelResponse> updateStatusRtlDetail(
      token, RtlDetailUpdateStatusFormModel dataForm) async {
    try {
      var dio = Dio();
      print('cek data sblm dikirim ${dataForm.toJson()}');
      var response = await dio.post("$baseUrl/rtl/update-status-rtl-detail",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return RtlDetailUpdateStatusFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          rowstamp: dataForm.rowstamp);
    } on DioError catch (err) {
      print('aww error $err');
      return RtlDetailUpdateStatusFormModelResponse(
          message: 'error', status_code: 500);
    }
  }

//performa
  Future<PerformaModelSelectResponse> getdataperforma(nikSap, token) async {
    print('sssss');
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-performa-by-nik-sap?nik_sap=$nikSap",
          options: optionAuth(token));

      dynamic callback = response.data;
      dynamic parsedData = callback['data'];
      print('parsedData11111 ${callback['data']}');

      return PerformaModelSelectResponse(
          status_code: callback['status_code'],
          message: callback['msg'],
          dataForm: PerformaModel.fromJson(parsedData));
    } on DioError catch (err) {
      return PerformaModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: PerformaModel());
    }
  }

  createApelPagiPengolahan(token, ApelPagiPengolahanFormModel dataForm) async {
    try {
      var dio = Dio();

      var response = await dio.post("$baseUrl/tasksheet-pengolahan/apel-pagi",
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

  Future<ApelPengolahanFormUpdateModelResponse> updateApelPagiPengolahan(
      token, ApelPengolahanFormUpdateModel dataForm) async {
    try {
      var dio = Dio();
      print('dataForm to json ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/apel-pagi/update-data-by-rowstamp",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      print('wewew $parsedData');
      return ApelPengolahanFormUpdateModelResponse(
        status_code: int.parse(callback['status_code']),
        message: callback['msg'],
        isCheckout: callback['is_checkout'],
        dataForm: parsedData
            .map((value) => ApelPengolahanFormModel.fromJson(value))
            .toList(),
      );
    } on DioError catch (err) {
      print('ApelPengolahanFormUpdateModelResponse $err');
      return ApelPengolahanFormUpdateModelResponse(
          message: err.response.toString(),
          status_code: 500,
          dataForm: [],
          isCheckout: false);
    }
  }

  Future<ApelPagiPengolahanFormModelSelectResponse>
      getDataApelPagiPengolahanByTanggal(tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/apel-pagi/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return ApelPagiPengolahanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => ApelPagiPengolahanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return ApelPagiPengolahanFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

//apel_pengolahan FIx
  Future<ApelPengolahanFormModelResponse> createApelPengolahan(
      token, ApelPengolahanFormModel dataForm) async {
    try {
      var dio = Dio();

      var response = await dio.post("$baseUrl/tasksheet-pengolahan/apel-pagi",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return ApelPengolahanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return ApelPengolahanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<ApelPengolahanFormModelSelectResponse> getDataApelPengolahanByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/apel-pagi/get-data-by-date-createdby?tanggal=$tanggal&createdBy=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return ApelPengolahanFormModelSelectResponse(
        status_code: int.parse(callback['status_code']),
        message: callback['msg'],
        isCheckout: callback['is_checkout'],
        dataForm: parsedData
            .map((value) => ApelPengolahanFormModel.fromJson(value))
            .toList(),
      );
    } on DioError catch (err) {
      return ApelPengolahanFormModelSelectResponse(
          status_code: 500,
          message: err.response.toString(),
          dataForm: [],
          isCheckout: false);
    }
  }

//estetika pabrik
  Future<EstetikaPabrikFormModelResponse> createEstetikaPabrik(
      token, EstetikaPabrikFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/estetika-pabrik",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return EstetikaPabrikFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return EstetikaPabrikFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<EstetikaPabrikFormModelSelectResponse> getEstetikaPabrikByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/estetika-pabrik/get-data-by-date-createdby?TANGGAL=$tanggal&CREATED_BY=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return EstetikaPabrikFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => EstetikaPabrikFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return EstetikaPabrikFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

//cek sampel Losis
  Future<CekSampelLosisFormModelResponse> createCekSampelLosis(
      token, CekSampelLosisFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/cek-sampel-losis",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return CekSampelLosisFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return CekSampelLosisFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<CekSampelLosisFormModelSelectResponse> getCekSampelLosisByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/cek-sampel-losis/get-data-by-date-createdby?TANGGAL=$tanggal&CREATED_BY=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return CekSampelLosisFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => CekSampelLosisFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return CekSampelLosisFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

// cek monitoring ipal
  Future<CekMonitoringIpalFormModelResponse> createCekMonitoringIpal(
      token, CekMonitoringIpalFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/cek-monitoring-ipal",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return CekMonitoringIpalFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return CekMonitoringIpalFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<CekMonitoringIpalFormModelSelectResponse>
      getCekMonitoringIpalByTanggal(tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/cek-monitoring-ipal/get-data-by-date-createdby?TANGGAL=$tanggal&CREATED_BY=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return CekMonitoringIpalFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => CekMonitoringIpalFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return CekMonitoringIpalFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

// cek rutin sortasi

  Future<CekRutinSortasiFormModelResponse> createCekRutinSortasi(
      token, CekRutinSortasiFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/cek-rutin-sortasi",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return CekRutinSortasiFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return CekRutinSortasiFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<CekRutinSortasiFormModelSelectResponse> getCekRutinSortasiByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/cek-rutin-sortasi/get-data-by-date-createdby?TANGGAL=$tanggal&CREATED_BY=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return CekRutinSortasiFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => CekRutinSortasiFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return CekRutinSortasiFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

  //  proses pengolahan

  Future<ProsesPengolahanFormModelResponse> createProsesPengolahan(
      token, ProsesPengolahanFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/proses-pengolahan",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return ProsesPengolahanFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return ProsesPengolahanFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<ProsesPengolahanFormModelSelectResponse> getProsesPengolahanByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/proses-pengolahan/get-data-by-date-createdby?TANGGAL=$tanggal&CREATED_BY=$createdBy",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return ProsesPengolahanFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => ProsesPengolahanFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return ProsesPengolahanFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

  //  proses pelaporan kerusakan alat

  Future<PelaporanKerusakanAlatFormModelResponse> createPelaporanKerusakanAlat(
      token, PelaporanKerusakanAlatFormModel dataForm) async {
    try {
      var dio = Dio();
      print('data yang mau dikirin ${dataForm.toJson()}');
      var response = await dio.post(
          "$baseUrl/tasksheet-pengolahan/pelaporan-kerusakan",
          data: dataForm.toJson(),
          options: optionAuth(token));
      dynamic callback = response.data;
      return PelaporanKerusakanAlatFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('errornya apa ${err.error}');
      return PelaporanKerusakanAlatFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<PelaporanKerusakanAlatFormModelSelectResponse>
      getPelaporanKerusakanAlatByTanggal(PSA, STATUS, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/pelaporan-kerusakan/get-data-by-PSA?PSA=$PSA&STATUS=$STATUS",
          options: optionAuth(token));

      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'];
      return PelaporanKerusakanAlatFormModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => PelaporanKerusakanAlatFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return PelaporanKerusakanAlatFormModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

  Future<PelaporanKerusakanAlatListModelSelectResponse>
      getPelaporanKerusakanAlatByCreatedBy(PSA, STATUS, token) async {
    try {
      var dio = Dio();
            print('apa nihh response yang minii ${"$baseUrl/tasksheet-pengolahan/pelaporan-kerusakan/get-data-by-PSA?PSA=$PSA&STATUS=$STATUS"} ');

      var response = await dio.get(
          "$baseUrl/tasksheet-pengolahan/pelaporan-kerusakan/get-data-by-psa?PSA=$PSA&STATUS=$STATUS",
          options: optionAuth(token));
      dynamic callback = response.data;
      List<dynamic> parsedData = callback['data'] != null  ? callback['data'] : [];
            print('apa nihh response yang minii 99999 ${callback['data']}');

      return PelaporanKerusakanAlatListModelSelectResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg'],
          dataForm: parsedData
              .map((value) => PelaporanKerusakanAlatFormModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return PelaporanKerusakanAlatListModelSelectResponse(
          status_code: 500, message: err.response.toString(), dataForm: []);
    }
  }

  // SELECTBOX Stasiun
  Future<StasiunModelResponse> getAllStasiun(String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-stasiun",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return StasiunModelResponse(
          stasiunModel:
              parsedData.map((value) => StasiunModel.fromJson(value)).toList());
    } on DioError {
      return StasiunModelResponse(stasiunModel: []);
      // return err.response.toString();
    }
  }
  Future<StasiunModelResponse> getAllStasiunES(String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-stasiun-ep",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return StasiunModelResponse(
          stasiunModel:
              parsedData.map((value) => StasiunModel.fromJson(value)).toList());
    } on DioError {
      return StasiunModelResponse(stasiunModel: []);
      // return err.response.toString();
    }
  }
  Future<StasiunModelResponse> getAllStasiunSL(String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-stasiun-sl",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return StasiunModelResponse(
          stasiunModel:
              parsedData.map((value) => StasiunModel.fromJson(value)).toList());
    } on DioError {
      return StasiunModelResponse(stasiunModel: []);
      // return err.response.toString();
    }
  }

  Future<KebunModelResponse> getKebunByCompany(token, company) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-kebun-by-company?company=$company",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return KebunModelResponse(
          Kebunmodel:
              parsedData.map((value) => KebunModel.fromJson(value)).toList());
    } on DioError {
      return KebunModelResponse(Kebunmodel: []);
      // return err.response.toString();
    }
  }

  Future<SampelLosisModelResponse> getSampelLosis(String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-sampel-losis",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return SampelLosisModelResponse(
          sampellosisModel: parsedData
              .map((value) => SampelLosisModel.fromJson(value))
              .toList());
    } on DioError {
      return SampelLosisModelResponse(sampellosisModel: []);
      // return err.response.toString();
    }
  }

  Future<JenisSampelModelResponse> getJenisSampel(
      String token, namasampellosis) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-jenis-losis?SAMPEL_LOSIS=$namasampellosis",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return JenisSampelModelResponse(
          sampellosisModel: parsedData
              .map((value) => JenisSampelModel.fromJson(value))
              .toList());
    } on DioError {
      return JenisSampelModelResponse(sampellosisModel: []);
      // return err.response.toString();
    }
  }

  // SELECTBOX Waktu Pengamatan
  Future<WaktuPengamatanModelResponse> getAllWaktuPengamatan(
      String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-waktu-pengamatan",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return WaktuPengamatanModelResponse(
          waktuPengamatanModel: parsedData
              .map((value) => WaktuPengamatanModel.fromJson(value))
              .toList());
    } on DioError {
      return WaktuPengamatanModelResponse(waktuPengamatanModel: []);
    }
  }

  // SELECTBOX Jenis kebersihan
  Future<JenisKebersihanModelResponse> getAllJenisKebersihan(
      String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-jenis-kebersihan",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return JenisKebersihanModelResponse(
          jenisKebersihanModel: parsedData
              .map((value) => JenisKebersihanModel.fromJson(value))
              .toList());
    } on DioError {
      return JenisKebersihanModelResponse(jenisKebersihanModel: []);
      // return err.response.toString();
    }
  }


  Future<JenisKerusakanModelResponse> getAllJenisKerusakan(
      String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-jenis-kerusakan",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return JenisKerusakanModelResponse(
          jeniskerusakanmodel: parsedData
              .map((value) => JenisKerusakanModel.fromJson(value))
              .toList());
    } on DioError {
      return JenisKerusakanModelResponse(jeniskerusakanmodel: []);
      // return err.response.toString();
    }
  }

  // SELECTBOX Tenaga Pengoperasian
  Future<TenagaPengoperasianModelResponse> getAllTenagaPengoperasian(
      String token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-tenaga-pengoperasian",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return TenagaPengoperasianModelResponse(
          tenagaPengoperasianModel: parsedData
              .map((value) => TenagaPengoperasianModel.fromJson(value))
              .toList());
    } on DioError {
      return TenagaPengoperasianModelResponse(tenagaPengoperasianModel: []);
    }
  }

  // SELECTBOX Kondisi Proses
  Future<KondisiProsesModelResponse> getAllKondisiProses(String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-kondisi-proses",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return KondisiProsesModelResponse(
          kondisiProsesModel: parsedData
              .map((value) => KondisiProsesModel.fromJson(value))
              .toList());
    } on DioError {
      return KondisiProsesModelResponse(kondisiProsesModel: []);
    }
  }

  // SELECTBOX Get Alat by Stasiun
  Future<AlatByStasiunModelResponse> getAlatByStasiun(
      String token, String kodeStasiun) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-alat-by-kode-stasiun?KODE_STASIUN=$kodeStasiun",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return AlatByStasiunModelResponse(
          alatByStasiunModel: parsedData
              .map((value) => AlatByStasiunModel.fromJson(value))
              .toList());
    } on DioError {
      return AlatByStasiunModelResponse(alatByStasiunModel: []);
    }
  }

  // SELECTBOX Kondisi PKS
  Future<KondisiPksModelResponse> getAllKondisiPks(String token) async {
    try {
      var dio = Dio();

      var response = await dio.get("$baseUrl/masterdata/get-kondisi-pks",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return KondisiPksModelResponse(
          kondisiPksModel: parsedData
              .map((value) => KondisiPksModel.fromJson(value))
              .toList());
    } on DioError {
      return KondisiPksModelResponse(kondisiPksModel: []);
    }
  }
}
