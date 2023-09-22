import 'dart:async';

import 'package:floor/floor.dart';
import 'package:patuhfy/data/local/dao/afdeling_dao.dart';
import 'package:patuhfy/data/local/dao/t_apel_pagi_dao.dart';
import 'package:patuhfy/data/local/dao/user_dao.dart';
import 'package:patuhfy/models/entities/afdeling_model_entity.dart';
import 'package:patuhfy/models/entities/t_apel_pagi_model_entity.dart';
import 'package:patuhfy/models/entities/user_model_entity.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 2, entities: [UserModel, AfdelingModel, TApelPagiEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  AfdelingDao get afdelingDao;
  TApelPagiDao get tApelpagiDao;
}
