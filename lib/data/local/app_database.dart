import 'dart:async';

import 'package:floor/floor.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/blok_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/user_model.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(
    version: 4,
    entities: [UserModel, AfdelingModel, BlokModel, ApelPagiFormModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  AfdelingDao get afdelingDao;
  BlokDao get blokDao;
  TApelPagiDao get tApelpagiDao;
}
