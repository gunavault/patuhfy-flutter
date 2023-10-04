import 'dart:async';

import 'package:floor/floor.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/blok_dao.dart';
import 'package:patuhfy/data/local/dao/mandor_dao.dart';
import 'package:patuhfy/data/local/dao/pemanen_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_tph_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/t_inspeksi_hanca_dao.dart';
import 'package:patuhfy/data/local/dao/t_lap_kerusakan_dao.dart';
import 'package:patuhfy/data/local/dao/t_pencurian_tbs_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/mandor_model.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 7, entities: [
  UserModel,
  AfdelingModel,
  BlokModel,
  ApelPagiFormModel,
  InspeksiHancaFormModel,
  InspeksiTphFormModel,
  PencurianTbsFormModel,
  LapKerusakanFormModel,
  MandorModel,
  PemanenModel
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
}
