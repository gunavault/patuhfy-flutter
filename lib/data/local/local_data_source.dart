import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final UserDao userDao;
  final AfdelingDao afdelingDao;
  final TApelPagiDao tApelPagiDao;

  LocalDataSource(this.userDao, this.afdelingDao, this.tApelPagiDao);

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

  // updateFoto() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var username = prefs.get String(keyUsername) ?? "";
  //   return await userDao.getUserByUsername(username);
  // }

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

  // Transaksi Apel Pagi Dao
  addDataApelPagi(ApelPagiFormModel dataForm) =>
      tApelPagiDao.insertDataApelPagi(dataForm);

  getAllDataApelPagi() async {
    return await tApelPagiDao.getAllApelPagi();
  }

  getDataApelPagiByTanggal(String tanggal) async {
    return await tApelPagiDao.getDataApelPagiByTanggal(tanggal);
  }

  deleteAllApelPagi() async {
    return await tApelPagiDao.deleteDataAPelPagi();
  }

  deleteDataAPelPagiByDate(String tanggal) async {
    return await tApelPagiDao.deleteDataAPelPagiByDate(tanggal);
  }
}
