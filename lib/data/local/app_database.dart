import 'dart:async';

import 'package:floor/floor.dart';
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
import 'package:patuhfy/data/local/dao/t_real_pengendalian_hama_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_penunasan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_penyiangan_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_pusingan_panen_dao.dart';
import 'package:patuhfy/data/local/dao/t_real_restan_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
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

import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart'; // the generated code will be there

@Database(version: 8, entities: [
  UserModel,
  AfdelingModel,
  BlokModel,
  ApelPagiFormModel,
  InspeksiHancaFormModel,
  InspeksiTphFormModel,
  PencurianTbsFormModel,
  LapKerusakanFormModel,
  MandorModel,
  PemanenModel,
  RealPemupukanFormModel,
  RealPenyianganFormModel,
  RealPenunasanFormModel,
  RealRestanFormModel,
  RealPemeliharaanJalanFormModel,
  RealPengendalianHamaFormModel,
  RealPusinganPanenFormModel,
  ApelPagiPengolahanFormModel,
])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  AfdelingDao get afdelingDao;
  BlokDao get blokDao;
  TApelPagiDao get tApelpagiDao;
  TInspeksiHancaDao get tInspeksiHancaDao;
  TInspeksiTphDao get tInspeksiTphDao;
  TPencurianTbsDao get tPencurianTbsDao;
  TLapKerusakanDao get tLapKerusakanDao;
  MandorDao get mandorDao;
  PemanenDao get pemanenDao;
  TRealPemupukanDao get tRealPemupukanDao;
  TRealPenyianganDao get tRealPenyianganDao;
  TRealPenunasanDao get tRealPenunasanDao;
  TRealRestanDao get tRealRestanDao;
  TRealPemeliharaanJalanDao get tRealPemeliharaanJalanDao;
  TRealPengendalianHamaDao get tRealPengendalianHamaDao;
  TRealPusinganPanenDao get tRealPusinganPanenDao;
  TApelPagiPengolahanDao get tApelPagiPengolahanDao;
}
