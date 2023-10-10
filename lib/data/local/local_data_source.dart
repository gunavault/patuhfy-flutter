import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/blok_dao.dart';
import 'package:patuhfy/data/local/dao/mandor_dao.dart';
import 'package:patuhfy/data/local/dao/pemanen_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_tph_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_hanca_dao.dart';
import 'package:patuhfy/data/local/dao/t_lap_kerusakan_dao.dart';
import 'package:patuhfy/data/local/dao/t_pencurian_tbs_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_pemupukan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_penunasan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_penyiangan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_restan_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
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
import 'package:patuhfy/models/real_penunasan_form_model.dart';
import 'package:patuhfy/models/real_penyiangan_form_model.dart';
import 'package:patuhfy/models/real_restan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final UserDao userDao;
  final AfdelingDao afdelingDao;
  final BlokDao blokDao;
  final TApelPagiDao tApelPagiDao;
  final TInspeksiHancaDao tInspeksiHancaDao;
  final TInspeksiTphDao tInspeksiTphDao;
  final TPencurianTbsDao tPencurianTbsDao;
  final TLapKerusakanDao tLapKerusakanDao;
  final MandorDao mandorDao;
  final PemanenDao pemanenDao;
  final TRealPemupukanDao tRealPemupukanDao;
  final TRealPenyianganDao tRealPenyianganDao;
  final TRealPenunasanDao tRealPenunasanDao;
  final TRealRestanDao tRealRestanDao;

  LocalDataSource(
      this.userDao,
      this.afdelingDao,
      this.blokDao,
      this.tApelPagiDao,
      this.tInspeksiHancaDao,
      this.tInspeksiTphDao,
      this.tPencurianTbsDao,
      this.tLapKerusakanDao,
      this.mandorDao,
      this.pemanenDao,
      this.tRealPemupukanDao,
      this.tRealPenyianganDao,
      this.tRealPenunasanDao,
      this.tRealRestanDao);

  //user
  addUser(UserModel userModel) => userDao.insertUser(userModel);

  getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nikSap = prefs.getString(keyNikSap) ?? "";
    return await userDao.getUserByNikSAP(nikSap);
  }

  Future<List<AfdelingModel>> getAllAfdeling() async {
    return await afdelingDao.getAllAfd();
  }

  deleteUser(String nikSap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nikSap = prefs.getString(keyNikSap) ?? "";
    return await userDao.deleteUserByNikSAP(nikSap);
  }

  //afdeling
  addAfdeling(AfdelingModel afdelingModel) =>
      afdelingDao.insertAfdeling(afdelingModel);

  deleteAfdeling() async {
    return await afdelingDao.deleteAfd();
  }

  Future<List<BlokModel>> getAllBlokByKodeAfd(
      String psa, String kodeAfd) async {
    List<BlokModel> data;
    return await blokDao.getAfdByPsaAndAfd(psa, kodeAfd);
  }

  getAllBlokByKodeAfdFilter(String psa, String kodeAfd, String filter) async {
    List<BlokModel> data;
    data = await blokDao.getAfdByPsaAndAfdFilter(psa, kodeAfd, filter);

    return data;
  }

  // Blok
  addBlok(BlokModel blokModel) => blokDao.insertBlok(blokModel);

  deleteBlok() async {
    return await blokDao.deleteBlok();
  }

  // Mandor Kelapa Sawit
  addMandor(MandorModel mandorModel) => mandorDao.insertMandor(mandorModel);

  deleteMandor() async {
    return await mandorDao.deleteMandor();
  }

  Future<List<MandorModel>> getAllMandor() async {
    return await mandorDao.getAllMandor();
  }

  // Pemanen Kelapa Sawit
  addPemanen(PemanenModel pemanenModel) =>
      pemanenDao.insertPemanen(pemanenModel);

  deletePemanen() async {
    return await pemanenDao.deletePemanen();
  }

  Future<List<PemanenModel>> getPemanenByMandor(String nikMandor) async {
    return await pemanenDao.getPemanenByMandor(nikMandor);
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

    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      ApelPagiFormModelSelectResponse response = await RemoteDataSource()
          .getDataApelPagiByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.isNotEmpty) {
        await addDataApelPagi(response.dataForm.first);
        return response.dataForm;
      } else {
        return dataForm;
      }
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
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      InspeksiHancaFormModelSelectResponse response = await RemoteDataSource()
          .getDataInspeksiHancaByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.isNotEmpty) {
        await addDataInspeksiHanca(response.dataForm.first);
        return response.dataForm;
      } else {
        return dataForm;
      }
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

  // Transaksi Inspeksi Tph Dao
  addDataInspeksiTph(InspeksiTphFormModel dataForm) =>
      tInspeksiTphDao.insertDataInspeksiTph(dataForm);

  getAllDataInspeksiTph() async {
    return await tInspeksiTphDao.getAllInspeksiTph();
  }

  getDataInspeksiTphByTanggal(String tanggal) async {
    return await tInspeksiTphDao.getDataInspeksiTphByTanggal(tanggal);
  }

  getDataInspeksiTphByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<InspeksiTphFormModel> dataForm;
    dataForm = await tInspeksiTphDao.getDataInspeksiTphByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      InspeksiTphFormModelSelectResponse response = await RemoteDataSource()
          .getDataInspeksiTphByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.isNotEmpty) {
        await addDataInspeksiTph(response.dataForm.first);
        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllInspeksiTph() async {
    return await tInspeksiTphDao.deleteDataInspeksiTph();
  }

  deleteDataInspeksiTphByDate(String tanggal) async {
    return await tInspeksiTphDao.deleteDataInspeksiTphByDate(tanggal);
  }

  // Transaksi Pencurian Tbs
  addDataPencurianTbs(PencurianTbsFormModel dataForm) =>
      tPencurianTbsDao.insertDataPencurianTbs(dataForm);

  getAllDataPencurianTbs() async {
    return await tPencurianTbsDao.getAllPencurianTbs();
  }

  getDataPencurianTbsByTanggal(String tanggal) async {
    return await tPencurianTbsDao.getDataPencurianTbsByTanggal(tanggal);
  }

  getDataPencurianTbsByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<PencurianTbsFormModel> dataForm;
    dataForm = await tPencurianTbsDao.getDataPencurianTbsByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      PencurianTbsFormModelSelectResponse response = await RemoteDataSource()
          .getDataPencurianTbsByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          addDataPencurianTbs(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllPencurianTbs() async {
    return await tPencurianTbsDao.deleteDataPencurianTbs();
  }

  deleteDataPencurianTbsByDate(String tanggal) async {
    return await tPencurianTbsDao.deleteDataPencurianTbsByDate(tanggal);
  }

  // Transaksi Laporan Kerusakan Dao
  addDataLapKerusakan(LapKerusakanFormModel dataForm) =>
      tLapKerusakanDao.insertDataLapKerusakan(dataForm);

  getAllDataLapKerusakan() async {
    return await tLapKerusakanDao.getAllLapKerusakan();
  }

  getDataLapKerusakanByTanggal(String tanggal) async {
    return await tLapKerusakanDao.getDataLapKerusakanByTanggal(tanggal);
  }

  getDataLapKerusakanByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<LapKerusakanFormModel> dataForm;
    dataForm = await tLapKerusakanDao.getDataLapKerusakanByTanggal(tanggal);

    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      LapKerusakanFormModelSelectResponse response = await RemoteDataSource()
          .getDataLapKerusakanByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.isNotEmpty) {
        await addDataLapKerusakan(response.dataForm.first);
        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllLapKerusakan() async {
    return await tLapKerusakanDao.deleteDataLapKerusakan();
  }

  deleteDataLapKerusakanByDate(String tanggal) async {
    return await tLapKerusakanDao.deleteDataLapKerusakanByDate(tanggal);
  }

  // Transaksi Pemupukan
  addDataRealPemupukan(RealPemupukanFormModel dataForm) =>
      tRealPemupukanDao.insertDataRealPemupukan(dataForm);

  getAllDataRealPemupukan() async {
    return await tRealPemupukanDao.getAllRealPemupukan();
  }

  getDataRealPemupukanByTanggal(String tanggal) async {
    return await tRealPemupukanDao.getDataRealPemupukanByTanggal(tanggal);
  }

  getDataRealPemupukanByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealPemupukanFormModel> dataForm;
    dataForm = await tRealPemupukanDao.getDataRealPemupukanByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealPemupukanFormModelSelectResponse response = await RemoteDataSource()
          .getDataRealPemupukanByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealPemupukan(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealPemupukan() async {
    return await tRealPemupukanDao.deleteDataRealPemupukan();
  }

  deleteDataRealPemupukanByDate(String tanggal) async {
    return await tRealPemupukanDao.deleteDataRealPemupukanByDate(tanggal);
  }

  // Transaksi Restan
  addDataRealRestan(RealRestanFormModel dataForm) =>
      tRealRestanDao.insertDataRealRestan(dataForm);

  getAllDataRealRestan() async {
    return await tRealRestanDao.getAllRealRestan();
  }

  getDataRealRestanByTanggal(String tanggal) async {
    return await tRealRestanDao.getDataRealRestanByTanggal(tanggal);
  }

  getDataRealRestanByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealRestanFormModel> dataForm;
    dataForm = await tRealRestanDao.getDataRealRestanByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealRestanFormModelSelectResponse response = await RemoteDataSource()
          .getDataRealRestanByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealRestan(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealRestan() async {
    return await tRealRestanDao.deleteDataRealRestan();
  }

  deleteDataRealRestanByDate(String tanggal) async {
    return await tRealRestanDao.deleteDataRealRestanByDate(tanggal);
  }


  // Transaksi realisasi penyiangan
  addDataRealPenyiangan(RealPenyianganFormModel dataForm) =>
      tRealPenyianganDao.insertDataRealPenyiangan(dataForm);

  getAllDataRealPenyiangan() async {
    return await tRealPenyianganDao.getAllRealPenyiangan();
  }

  getDataRealPenyianganByTanggal(String tanggal) async {
    return await tRealPenyianganDao.getDataRealPenyianganByTanggal(tanggal);
  }

  getDataRealPenyianganByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealPenyianganFormModel> dataForm;
    dataForm = await tRealPenyianganDao.getDataRealPenyianganByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealPenyianganFormModelSelectResponse response = await RemoteDataSource()
          .getDataRealPenyianganByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealPenyiangan(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealPenyiangan() async {
    return await tRealPenyianganDao.deleteDataRealPenyiangan();
  }

  deleteDataRealPenyianganByDate(String tanggal) async {
    return await tRealPenyianganDao.deleteDataRealPenyianganByDate(tanggal);
  }


//Transaksi Realisasi Penunasan


  addDataRealPenunasan(RealPenunasanFormModel dataForm) =>
      tRealPenunasanDao.insertDataRealPenunasan(dataForm);

  getAllDataRealPenunasan() async {
    return await tRealPenunasanDao.getAllRealPenunasan();
  }

  getDataRealPenunasanByTanggal(String tanggal) async {
    return await tRealPenunasanDao.getDataRealPenunasanByTanggal(tanggal);
  }

  getDataRealPenunasanByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealPenunasanFormModel> dataForm;
    dataForm = await tRealPenunasanDao.getDataRealPenunasanByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealPenunasanFormModelSelectResponse response = await RemoteDataSource()
          .getDataRealPenunasanByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealPenunasan(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealPenunasan() async {
    return await tRealPenunasanDao.deleteDataRealPenunasan();
  }

  deleteDataRealPenunasanByDate(String tanggal) async {
    return await tRealPenunasanDao.deleteDataRealPenunasanByDate(tanggal);
  }


}
