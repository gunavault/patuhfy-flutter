// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  AfdelingDao? _afdelingDaoInstance;

  BlokDao? _blokDaoInstance;

  TApelPagiDao? _tApelpagiDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 4,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER, `nik_sap` TEXT, `name` TEXT, `company_code` TEXT, `company_shortname` TEXT, `company_longname` TEXT, `psa` TEXT, `psa_name` TEXT, `role` TEXT, `token` TEXT, `foto` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `m_afdeling` (`kodeAfd` TEXT, PRIMARY KEY (`kodeAfd`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `m_blok` (`kodePsa` TEXT, `kodeAfd` TEXT, `kodeBlok` TEXT, `namaBlok` TEXT, `tahunTanam` TEXT, PRIMARY KEY (`kodePsa`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_apel_pagi` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `tanggal` TEXT, `company` TEXT, `unitKerja` TEXT, `afd` TEXT, `foto` TEXT, `createdBy` TEXT, `long` TEXT, `lat` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  AfdelingDao get afdelingDao {
    return _afdelingDaoInstance ??= _$AfdelingDao(database, changeListener);
  }

  @override
  BlokDao get blokDao {
    return _blokDaoInstance ??= _$BlokDao(database, changeListener);
  }

  @override
  TApelPagiDao get tApelpagiDao {
    return _tApelpagiDaoInstance ??= _$TApelPagiDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'nik_sap': item.nik_sap,
                  'name': item.name,
                  'company_code': item.company_code,
                  'company_shortname': item.company_shortname,
                  'company_longname': item.company_longname,
                  'psa': item.psa,
                  'psa_name': item.psa_name,
                  'role': item.role,
                  'token': item.token,
                  'foto': item.foto
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  @override
  Future<UserModel?> getUserByNikSAP(String nik_sap) async {
    return _queryAdapter.query('SELECT * FROM user WHERE nik_sap = ?1',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            nik_sap: row['nik_sap'] as String?,
            name: row['name'] as String?,
            company_code: row['company_code'] as String?,
            company_shortname: row['company_shortname'] as String?,
            company_longname: row['company_longname'] as String?,
            psa: row['psa'] as String?,
            psa_name: row['psa_name'] as String?,
            role: row['role'] as String?,
            token: row['token'] as String?,
            foto: row['foto'] as String?),
        arguments: [nik_sap]);
  }

  @override
  Future<bool?> deleteUserByNikSAP(String nik_sap) async {
    return _queryAdapter.query('DELETE FROM user WHERE nik_sap=?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [nik_sap]);
  }

  @override
  Future<void> insertUser(UserModel user) async {
    await _userModelInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }
}

class _$AfdelingDao extends AfdelingDao {
  _$AfdelingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _afdelingModelInsertionAdapter = InsertionAdapter(
            database,
            'm_afdeling',
            (AfdelingModel item) => <String, Object?>{'kodeAfd': item.kodeAfd});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AfdelingModel> _afdelingModelInsertionAdapter;

  @override
  Future<AfdelingModel?> getAfdByPSA(String psa) async {
    return _queryAdapter.query('SELECT * FROM m_afdeling WHERE nik_sap = ?1',
        mapper: (Map<String, Object?> row) =>
            AfdelingModel(kodeAfd: row['kodeAfd'] as String?),
        arguments: [psa]);
  }

  @override
  Future<List<AfdelingModel>> getAllAfd() async {
    return _queryAdapter.queryList('SELECT * FROM m_afdeling',
        mapper: (Map<String, Object?> row) =>
            AfdelingModel(kodeAfd: row['kodeAfd'] as String?));
  }

  @override
  Future<bool?> deleteAfd() async {
    return _queryAdapter.query('DELETE FROM m_afdeling',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertAfdeling(AfdelingModel afd) async {
    await _afdelingModelInsertionAdapter.insert(
        afd, OnConflictStrategy.replace);
  }
}

class _$BlokDao extends BlokDao {
  _$BlokDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _blokModelInsertionAdapter = InsertionAdapter(
            database,
            'm_blok',
            (BlokModel item) => <String, Object?>{
                  'kodePsa': item.kodePsa,
                  'kodeAfd': item.kodeAfd,
                  'kodeBlok': item.kodeBlok,
                  'namaBlok': item.namaBlok,
                  'tahunTanam': item.tahunTanam
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BlokModel> _blokModelInsertionAdapter;

  @override
  Future<BlokModel?> getBlokByPsa(String psa) async {
    return _queryAdapter.query('SELECT * FROM m_blok WHERE kodePsa = ?1',
        mapper: (Map<String, Object?> row) => BlokModel(
            kodePsa: row['kodePsa'] as String?,
            kodeAfd: row['kodeAfd'] as String?,
            kodeBlok: row['kodeBlok'] as String?,
            namaBlok: row['namaBlok'] as String?,
            tahunTanam: row['tahunTanam'] as String?),
        arguments: [psa]);
  }

  @override
  Future<BlokModel?> getAfdByPsaAndAfd(
    String psa,
    String afd,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM m_blok WHERE kodePsa = ?1 and kodeAfd = ?2',
        mapper: (Map<String, Object?> row) => BlokModel(
            kodePsa: row['kodePsa'] as String?,
            kodeAfd: row['kodeAfd'] as String?,
            kodeBlok: row['kodeBlok'] as String?,
            namaBlok: row['namaBlok'] as String?,
            tahunTanam: row['tahunTanam'] as String?),
        arguments: [psa, afd]);
  }

  @override
  Future<List<BlokModel>> getAllBlok() async {
    return _queryAdapter.queryList('SELECT * FROM m_blok',
        mapper: (Map<String, Object?> row) => BlokModel(
            kodePsa: row['kodePsa'] as String?,
            kodeAfd: row['kodeAfd'] as String?,
            kodeBlok: row['kodeBlok'] as String?,
            namaBlok: row['namaBlok'] as String?,
            tahunTanam: row['tahunTanam'] as String?));
  }

  @override
  Future<bool?> deleteBlok() async {
    return _queryAdapter.query('DELETE FROM m_blok',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertBlok(BlokModel blok) async {
    await _blokModelInsertionAdapter.insert(blok, OnConflictStrategy.replace);
  }
}

class _$TApelPagiDao extends TApelPagiDao {
  _$TApelPagiDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _apelPagiFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_apel_pagi',
            (ApelPagiFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'company': item.company,
                  'unitKerja': item.unitKerja,
                  'afd': item.afd,
                  'foto': item.foto,
                  'createdBy': item.createdBy,
                  'long': item.long,
                  'lat': item.lat
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ApelPagiFormModel> _apelPagiFormModelInsertionAdapter;

  @override
  Future<List<ApelPagiFormModel>> getDataApelPagiByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_apel_pagi WHERE tanggal = ?1',
        mapper: (Map<String, Object?> row) => ApelPagiFormModel(
            tanggal: row['tanggal'] as String?,
            company: row['company'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            foto: row['foto'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?),
        arguments: [tanggal]);
  }

  @override
  Future<List<ApelPagiFormModel>> getAllApelPagi() async {
    return _queryAdapter.queryList('SELECT * FROM t_apel_pagi',
        mapper: (Map<String, Object?> row) => ApelPagiFormModel(
            tanggal: row['tanggal'] as String?,
            company: row['company'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            foto: row['foto'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?));
  }

  @override
  Future<bool?> deleteDataAPelPagi() async {
    return _queryAdapter.query('DELETE FROM t_apel_pagi',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataAPelPagiByDate(String tanggal) async {
    return _queryAdapter.query('DELETE FROM t_apel_pagi where tanggal = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataApelPagi(ApelPagiFormModel data) async {
    await _apelPagiFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}
