import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
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
      print('error di api ${err.response.toString()}');
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
      print('scallback $callback');
      return ApelPagiFormModelResponse(
          status_code: int.parse(callback['status_code']),
          message: callback['msg']);
    } on DioError catch (err) {
      print('error ${err.response.toString()}');
      return ApelPagiFormModelResponse(
          message: err.response.toString(), status_code: 500);
    }
  }
}
