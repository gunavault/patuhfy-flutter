import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/models/entities/afdeling_model_entity.dart';
import 'package:patuhfy/models/entities/user_model_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final UserDao userDao;
  final AfdelingDao afdelingDao;

  LocalDataSource(this.userDao, this.afdelingDao);

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
}
