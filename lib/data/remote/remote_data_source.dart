import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/selectbox/selectbox_afdeling_model.dart';
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

  Future<UserModelResponse> login(nik_sap, password) async {
    try {
      var dio = Dio();
      var response = await dio.post("$baseUrl/login",
          data: {"nik_sap": nik_sap, "password": password});
      return UserModelResponse(userModel: UserModel.fromJson(response.data));
    } on DioError catch (err) {
      return UserModelResponse(message: err.response.toString());
    }
  }

  Future getAfdelingData(kodePsa, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-afd-by-psa?psa=AK01",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return AfdelingModelResponse(
          afdelingModel: parsedData
              .map((value) => AfdelingModel.fromJson(value))
              .toList());
    } on DioError catch (err) {
      return [];
      // return err.response.toString();
    }
  }

  Future getBlokData(String kodePsa, String company, String token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/masterdata/get-blok-by-psa?psa=AK01&&company=${company}",
          options: optionAuth(token));

      List<dynamic> parsedData = response.data['data'];
      return BlokModelResponse(
          blokModel:
              parsedData.map((value) => BlokModel.fromJson(value)).toList());
    } on DioError catch (err) {
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
          'cek apel pagi $baseUrl/tasksheet/apel-pagi/get-data-by-date-createdby?tanggal=${tanggal}&createdBy=${createdBy}');
      var response = await dio.get(
          "$baseUrl/tasksheet/apel-pagi/get-data-by-date-createdby?tanggal=${tanggal}&createdBy=${createdBy}",
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
          "$baseUrl/tasksheet/inspeksi-hanca/get-data-by-date-createdby?tanggal=${tanggal}&createdBy=${createdBy}",
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
          "$baseUrl/tasksheet/inspeksi-tph/get-data-by-date-createdby?tanggal=${tanggal}&createdBy=${createdBy}",
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

      var response = await dio.post("$baseUrl/tasksheet/pencurian-tbs",
          data: dataForm.toJson(), options: optionAuth(token));
      dynamic callback = response.data;
      return PencurianTbsFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      return PencurianTbsFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }

  Future<PencurianTbsFormModelSelectResponse> getDataPencurianTbsByTanggal(
      tanggal, createdBy, token) async {
    try {
      var dio = Dio();

      var response = await dio.get(
          "$baseUrl/tasksheet/pencurian-tbs/get-data-by-date-createdby?tanggal=${tanggal}&createdBy=${createdBy}",
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
}
