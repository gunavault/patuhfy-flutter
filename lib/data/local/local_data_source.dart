import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/blok_dao.dart';
import 'package:patuhfy/data/local/dao/mandor_dao.dart';
import 'package:patuhfy/data/local/dao/pemanen_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_pengolahan_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_tph_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_hanca_dao.dart';
import 'package:patuhfy/data/local/dao/t_lap_kerusakan_dao.dart';
import 'package:patuhfy/data/local/dao/t_pencurian_tbs_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_pemeliharaan_jalan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_pemupukan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_penunasan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_penyiangan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_restan_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/mandor_model.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';
import 'package:patuhfy/models/real_penunasan_form_model.dart';
import 'package:patuhfy/models/real_penyiangan_form_model.dart';
import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';
import 'package:patuhfy/models/real_restan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:patuhfy/data/local/dao/t_real_pengendalian_hama_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_pusingan_panen_dao.dart';

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
  final TRealPemeliharaanJalanDao tRealPemeliharaanJalanDao;
  final TRealPengendalianHamaDao tRealPengendalianHamaDao;
  final TRealPusinganPanenDao tRealPusinganPanenDao;
  final TApelPagiPengolahanDao tApelPagiPengolahanDao;

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
      this.tRealRestanDao,
      this.tRealPemeliharaanJalanDao,
      this.tRealPengendalianHamaDao,
      this.tRealPusinganPanenDao,
      this.tApelPagiPengolahanDao);

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
    print('data dari lokal $dataForm');
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      ApelPagiFormModelSelectResponse response = await RemoteDataSource()
          .getDataApelPagiByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      print('data dari remote ${response.dataForm.first}');
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
    await deletePencurianDataWhichHasSend();
    // dataForm = await tPencurianTbsDao.getDataPencurianTbsByTanggal(tanggal);
    // if (dataForm.isEmpty) {
    // Jika data 0 lokal data, cek ke online
    UserModel userModel = await getCurrentUser();
    PencurianTbsFormModelSelectResponse response = await RemoteDataSource()
        .getDataPencurianTbsByTanggal(
            tanggal, userModel.nik_sap, userModel.token);
    if (response.dataForm.isNotEmpty) {
      for (var data in response.dataForm) {
        addDataPencurianTbs(data);
      }

      int count = await getPencurianTbsDataNotSend() ?? 0;

      if (count > 0) {
        return [PencurianTbsFormModel(isSend: 0)];
      } else {
        return [PencurianTbsFormModel(isSend: 1)];
      }
    } else {
      return [PencurianTbsFormModel(isSend: 0)];
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

  // Transaksi pengendalian hama
  addDataRealPengendalianHama(RealPengendalianHamaFormModel dataForm) =>
      tRealPengendalianHamaDao.insertDataRealPengendalianHama(dataForm);

  getAllDataRealPengendalianHama() async {
    return await tRealPengendalianHamaDao.getAllRealPengendalianHama();
  }

  getDataRealPengendalianHamaByTanggal(String tanggal) async {
    return await tRealPengendalianHamaDao
        .getDataRealPengendalianHamaByTanggal(tanggal);
  }

  getDataRealPengendalianHamaByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealPengendalianHamaFormModel> dataForm;
    dataForm = await tRealPengendalianHamaDao
        .getDataRealPengendalianHamaByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealPengendalianHamaFormModelSelectResponse response =
          await RemoteDataSource().getDataRealPengendalianHamaByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealPengendalianHama(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealPengendalianHama() async {
    return await tRealPengendalianHamaDao.deleteDataRealPengendalianHama();
  }

  deleteDataRealPengendalianHamaByDate(String tanggal) async {
    return await tRealPengendalianHamaDao
        .deleteDataRealPengendalianHamaByDate(tanggal);
  }

  // Transaksi Realisasi Pemeliharaan Jalan
  addDataRealPemeliharaanJalan(RealPemeliharaanJalanFormModel dataForm) =>
      tRealPemeliharaanJalanDao.insertDataRealPemeliharaanJalan(dataForm);

  getAllDataRealPemeliharaanJalan() async {
    return await tRealPemeliharaanJalanDao.getAllRealPemeliharaanJalan();
  }

  getDataRealPemeliharaanJalanByTanggal(String tanggal) async {
    return await tRealPemeliharaanJalanDao
        .getDataRealPemeliharaanJalanByTanggal(tanggal);
  }

  getDataRealPemeliharaanJalanByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealPemeliharaanJalanFormModel> dataForm;
    dataForm = await tRealPemeliharaanJalanDao
        .getDataRealPemeliharaanJalanByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealPemeliharaanJalanFormModelSelectResponse response =
          await RemoteDataSource().getDataRealPemeliharaanJalanByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealPemeliharaanJalan(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealPemeliharaanJalan() async {
    return await tRealPemeliharaanJalanDao.deleteDataRealPemeliharaanJalan();
  }

  deleteDataRealPemeliharaanJalanByDate(String tanggal) async {
    return await tRealPemeliharaanJalanDao
        .deleteDataRealPemeliharaanJalanByDate(tanggal);
  }

  // Transaksi pusingan panen
  addDataRealPusinganPanen(RealPusinganPanenFormModel dataForm) =>
      tRealPusinganPanenDao.insertDataRealPusinganPanen(dataForm);

  getAllDataRealPusinganPanen() async {
    return await tRealPusinganPanenDao.getAllRealPusinganPanen();
  }

  getDataRealPusinganPanenByTanggal(String tanggal) async {
    return await tRealPusinganPanenDao
        .getDataRealPusinganPanenByTanggal(tanggal);
  }

  getDataRealPusinganPanenByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<RealPusinganPanenFormModel> dataForm;
    dataForm =
        await tRealPusinganPanenDao.getDataRealPusinganPanenByTanggal(tanggal);
    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();
      RealPusinganPanenFormModelSelectResponse response =
          await RemoteDataSource().getDataRealPusinganPanenByTanggal(
              tanggal, userModel.nik_sap, userModel.token);
      if (response.dataForm.isNotEmpty) {
        for (var data in response.dataForm) {
          await addDataRealPusinganPanen(data);
        }

        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllRealPusinganPanen() async {
    return await tRealPusinganPanenDao.deleteDataRealPusinganPanen();
  }

  deleteDataRealPusinganPanenByDate(String tanggal) async {
    return await tRealPusinganPanenDao
        .deleteDataRealPusinganPanenByDate(tanggal);
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

  // Transaksi Apel Pagi Pengolahan Dao
  addDataApelPagiPengolahan(ApelPagiPengolahanFormModel dataForm) =>
      tApelPagiPengolahanDao.insertDataApelPagiPengolahan(dataForm);

  getAllDataApelPagiPengolahan() async {
    return await tApelPagiPengolahanDao.getAllApelPagiPengolahan();
  }

  getDataApelPagiPengolahanByTanggal(String tanggal) async {
    return await tApelPagiPengolahanDao
        .getDataApelPagiPengolahanByTanggal(tanggal);
  }

  getDataApelPagiPengolahanByTanggalOnlineOrOffline(String tanggal) async {
    // cek off line dlu
    List<ApelPagiPengolahanFormModel> dataForm;
    dataForm = await tApelPagiPengolahanDao
        .getDataApelPagiPengolahanByTanggal(tanggal);

    if (dataForm.isEmpty) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await getCurrentUser();

      ApelPagiPengolahanFormModelSelectResponse response =
          await RemoteDataSource().getDataApelPagiPengolahanByTanggal(
              tanggal, userModel.nik_sap, userModel.token);

      if (response.dataForm.isNotEmpty) {
        await addDataApelPagiPengolahan(response.dataForm.first);
        return response.dataForm;
      } else {
        return dataForm;
      }
    } else {
      return dataForm;
    }
  }

  deleteAllApelPagiPengolahan() async {
    return await tApelPagiPengolahanDao.deleteDataApelPagiPengolahan();
  }

  deleteDataApelPagiPengolahanByDate(String tanggal) async {
    return await tApelPagiPengolahanDao
        .deleteDataApelPagiPengolahanByDate(tanggal);
  }

  // Sync
  Future<int?> getApelPagiDataNotSend() {
    return tApelPagiDao.getCountNotSend();
  }

  Future<int?> getInspeksiHancaDataNotSend() {
    return tInspeksiHancaDao.getCountNotSend();
  }

  Future<int?> getInspeksiTphDataNotSend() {
    return tInspeksiTphDao.getCountNotSend();
  }

  Future<int?> getPencurianTbsDataNotSend() {
    return tPencurianTbsDao.getCountNotSend();
  }

  Future<int?> getLapKerusakanDataNotSend() {
    return tLapKerusakanDao.getCountNotSend();
  }

  Future<int?> getRealPemupukanDataNotSend() {
    return tRealPemupukanDao.getCountNotSend();
  }

  Future<int?> getRealPenyinanganDataNotSend() {
    return tRealPenyianganDao.getCountNotSend();
  }

  Future<int?> getRealPenunasanDataNotSend() {
    return tRealPenunasanDao.getCountNotSend();
  }

  Future<int?> getRealRestanDataNotSend() {
    return tRealRestanDao.getCountNotSend();
  }

  Future<int?> getRealPemeliharaanJalanDataNotSend() {
    return tRealPemeliharaanJalanDao.getCountNotSend();
  }

  Future<int?> getRealPengendalianHamaDataNotSend() {
    return tRealPengendalianHamaDao.getCountNotSend();
  }

  Future<int?> getRealPusinganPanenDataNotSend() {
    return tRealPusinganPanenDao.getCountNotSend();
  }

  Future<int?> getApelPagiPengolahanDataNotSend() {
    return tApelPagiPengolahanDao.getCountNotSend();
  }

  Future<int?> getRealPenyianganDataNotSend() {
    return tApelPagiPengolahanDao.getCountNotSend();
  }

  // delete data

  Future<bool?> deleteApelPagiById(id) {
    return tApelPagiDao.deleteDataById(id);
  }

  Future<bool?> deleteInspeksiHancaById(int id) {
    return tInspeksiHancaDao.deleteDataById(id);
  }

  Future<bool?> deleteInspeksiTphById(int id) {
    return tInspeksiTphDao.deleteDataById(id);
  }

  Future<bool?> deletePencurianTbsById(int id) {
    return tPencurianTbsDao.deleteDataById(id);
  }

  Future<bool?> deletePencurianDataWhichHasSend() {
    return tPencurianTbsDao.deleteDataWhichHasSend();
  }

  Future<bool?> deleteLapKerusakanById(int id) {
    return tLapKerusakanDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPemupukanById(int id) {
    return tRealPemupukanDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPenyinanganById(int id) {
    return tRealPenyianganDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPenunasanById(int id) {
    return tRealPenunasanDao.deleteDataById(id);
  }

  Future<bool?> deleteRealRestanById(int id) {
    return tRealRestanDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPemeliharaanJalanById(int id) {
    return tRealPemeliharaanJalanDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPengendalianHamaById(int id) {
    return tRealPengendalianHamaDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPusinganPanenById(int id) {
    return tRealPusinganPanenDao.deleteDataById(id);
  }

  Future<bool?> deleteApelPagiPengolahanById(int id) {
    return tApelPagiPengolahanDao.deleteDataById(id);
  }

  Future<bool?> deleteRealPenyianganById(int id) {
    return tApelPagiPengolahanDao.deleteDataById(id);
  }

  // Get Sync List

  Future<List<ApelPagiFormModel>> getAllDataApelPagiDataNotSend() {
    return tApelPagiDao.getAllDataNotSend();
  }

  Future<List<InspeksiHancaFormModel>> getAllDataInspeksiHancaDataNotSend() {
    return tInspeksiHancaDao.getAllDataNotSend();
  }

  Future<List<InspeksiTphFormModel>> getAllDataInspeksiTphDataNotSend() {
    return tInspeksiTphDao.getAllDataNotSend();
  }

  Future<List<PencurianTbsFormModel>> getAllDataPencurianTbsDataNotSend() {
    return tPencurianTbsDao.getAllDataNotSend();
  }

  Future<List<LapKerusakanFormModel>> getAllDataLapKerusakanDataNotSend() {
    return tLapKerusakanDao.getAllDataNotSend();
  }

  Future<List<RealPemupukanFormModel>> getAllDataRealPemupukanDataNotSend() {
    return tRealPemupukanDao.getAllDataNotSend();
  }

  Future<List<RealPenyianganFormModel>> getAllDataRealPenyinanganDataNotSend() {
    return tRealPenyianganDao.getAllDataNotSend();
  }

  Future<List<RealPenunasanFormModel>> getAllDataRealPenunasanDataNotSend() {
    return tRealPenunasanDao.getAllDataNotSend();
  }

  Future<List<RealRestanFormModel>> getAllDataRealRestanDataNotSend() {
    return tRealRestanDao.getAllDataNotSend();
  }

  Future<List<RealPemeliharaanJalanFormModel>>
      getAllDataRealPemeliharaanJalanDataNotSend() {
    return tRealPemeliharaanJalanDao.getAllDataNotSend();
  }

  Future<List<RealPengendalianHamaFormModel>>
      getAllDataRealPengendalianHamaDataNotSend() {
    return tRealPengendalianHamaDao.getAllDataNotSend();
  }

  Future<List<RealPusinganPanenFormModel>>
      getAllDataRealPusinganPanenDataNotSend() {
    return tRealPusinganPanenDao.getAllDataNotSend();
  }

  Future<List<ApelPagiPengolahanFormModel>>
      getAllDataApelPagiPengolahanDataNotSend() {
    return tApelPagiPengolahanDao.getAllDataNotSend();
  }

  Future<List<RealPenyianganFormModel>> getAllDataRealPenyianganDataNotSend() {
    return tRealPenyianganDao.getAllDataNotSend();
  }

  Future<int> getCountNotSend() async {
    int? apelPagi = await tApelPagiDao.getCountNotSend();
    int? inspeksiHanca = await tInspeksiHancaDao.getCountNotSend();
    int? inspeksiTph = await tInspeksiTphDao.getCountNotSend();
    int? pencurianTbs = await tPencurianTbsDao.getCountNotSend();
    int? lapKerusakan = await tLapKerusakanDao.getCountNotSend();

    int? realPemupukan = await tRealPemupukanDao.getCountNotSend();
    int? realPenyinangan = await tRealPenyianganDao.getCountNotSend();
    int? realPenunasan = await tRealPenunasanDao.getCountNotSend();
    int? realRestan = await tRealRestanDao.getCountNotSend();
    int? realPemeliharaanJalan =
        await tRealPemeliharaanJalanDao.getCountNotSend();
    int? realPengendalianHama =
        await tRealPengendalianHamaDao.getCountNotSend();
    int? realPusinganPanen = await tRealPusinganPanenDao.getCountNotSend();
    int? apelPagiPengolahan = await tApelPagiPengolahanDao.getCountNotSend();

    int totalSum = (apelPagi ?? 0) +
        (inspeksiHanca ?? 0) +
        (inspeksiTph ?? 0) +
        (pencurianTbs ?? 0) +
        (lapKerusakan ?? 0) +
        (realPemupukan ?? 0) +
        (realPenyinangan ?? 0) +
        (realPenunasan ?? 0) +
        (realRestan ?? 0) +
        (realPemeliharaanJalan ?? 0) +
        (realPengendalianHama ?? 0) +
        (realPusinganPanen ?? 0) +
        (apelPagiPengolahan ?? 0);
    return totalSum;
  }
}
