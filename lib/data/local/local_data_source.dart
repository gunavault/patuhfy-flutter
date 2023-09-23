import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/blok_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_hanca_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final UserDao userDao;
  final AfdelingDao afdelingDao;
  final BlokDao blokDao;
  final TApelPagiDao tApelPagiDao;
  final TInspeksiHancaDao tInspeksiHancaDao;

  LocalDataSource(this.userDao, this.afdelingDao, this.blokDao,
      this.tApelPagiDao, this.tInspeksiHancaDao);

  //user
  addUser(UserModel userModel) => userDao.insertUser(userModel);

  getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik_sap = prefs.getString(keyNikSap) ?? "";
    return await userDao.getUserByNikSAP(nik_sap);
  }

  getAllAfdeling() async {
    return await afdelingDao.getAllAfd();
  }

  deleteUser(String nik_sap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik_sap = prefs.getString(keyNikSap) ?? "";
    return await userDao.deleteUserByNikSAP(nik_sap);
  }

  //afdeling
  addAfdeling(AfdelingModel afdelingModel) =>
      afdelingDao.insertAfdeling(afdelingModel);

  deleteAfdeling() async {
    return await afdelingDao.deleteAfd();
  }

  // Blok
  addBlok(BlokModel blokModel) => blokDao.insertBlok(blokModel);

  deleteBlok() async {
    return await blokDao.deleteBlok();
  }

  // Transaksi Apel Pagi Dao
  addDataApelPagi(ApelPagiFormModel dataForm) =>
      tApelPagiDao.insertDataApelPagi(dataForm);

  getAllDataApelPagi() async {
    return await tApelPagiDao.getAllApelPagi();
  }

  getDataApelPagiByTanggal(String tanggal) async {
    return await tApelPagiDao.getDataApelPagiByTanggal(tanggal);
  }

  getDataApelPagiByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<ApelPagiFormModel> dataForm;
    dataForm = await tApelPagiDao.getDataApelPagiByTanggal(tanggal);

    if (dataForm.length == 0) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      ApelPagiFormModelSelectResponse response = await RemoteDataSource()
          .getDataApelPagiByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.length != 0) {
        await addDataApelPagi(response.dataForm.first);
      }

      return response.dataForm;
    } else {
      return dataForm;
    }
  }

  deleteAllApelPagi() async {
    return await tApelPagiDao.deleteDataAPelPagi();
  }

  deleteDataAPelPagiByDate(String tanggal) async {
    return await tApelPagiDao.deleteDataAPelPagiByDate(tanggal);
  }

  // Transaksi Inspeksi Hanca Dao
  addDataInspeksiHanca(InspeksiHancaFormModel dataForm) =>
      tInspeksiHancaDao.insertDataInspeksiHanca(dataForm);

  getAllDataInspeksiHanca() async {
    return await tInspeksiHancaDao.getAllInspeksiHanca();
  }

  getDataInspeksiHancaByTanggal(String tanggal) async {
    return await tInspeksiHancaDao.getDataInspeksiHancaByTanggal(tanggal);
  }

  getDataInspeksiHancaByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<InspeksiHancaFormModel> dataForm;
    dataForm = await tInspeksiHancaDao.getDataInspeksiHancaByTanggal(tanggal);

    if (dataForm.length == 0) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      InspeksiHancaFormModelSelectResponse response = await RemoteDataSource()
          .getDataInspeksiHancaByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.length != 0) {
        await addDataInspeksiHanca(response.dataForm.first);
      }

      return response.dataForm;
    } else {
      return dataForm;
    }
  }

  deleteAllInspeksiHanca() async {
    return await tInspeksiHancaDao.deleteDataInspeksiHanca();
  }

  deleteDataInspeksiHancaByDate(String tanggal) async {
    return await tInspeksiHancaDao.deleteDataInspeksiHancaByDate(tanggal);
  }
}
