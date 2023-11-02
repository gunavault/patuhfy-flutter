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

  TInspeksiHancaDao? _tInspeksiHancaDaoInstance;

  TInspeksiTphDao? _tInspeksiTphDaoInstance;

  TPencurianTbsDao? _tPencurianTbsDaoInstance;

  TLapKerusakanDao? _tLapKerusakanDaoInstance;

  MandorDao? _mandorDaoInstance;

  PemanenDao? _pemanenDaoInstance;

  TRealPemupukanDao? _tRealPemupukanDaoInstance;

  TRealPenyianganDao? _tRealPenyianganDaoInstance;

  TRealPenunasanDao? _tRealPenunasanDaoInstance;

  TRealRestanDao? _tRealRestanDaoInstance;

  TRealPemeliharaanJalanDao? _tRealPemeliharaanJalanDaoInstance;

  TRealPengendalianHamaDao? _tRealPengendalianHamaDaoInstance;

  TRealPusinganPanenDao? _tRealPusinganPanenDaoInstance;

  TApelPagiPengolahanDao? _tApelPagiPengolahanDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 8,
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
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER, `nik_sap` TEXT, `name` TEXT, `company_code` TEXT, `company_shortname` TEXT, `company_longname` TEXT, `psa` TEXT, `psa_name` TEXT, `psa_tipe` TEXT, `role` TEXT, `token` TEXT, `foto` TEXT, `hasSawit` INTEGER, `hasKaret` INTEGER, `hasTeh` INTEGER, `hasTebu` INTEGER, `hasKopi` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `m_afdeling` (`kodeAfd` TEXT, PRIMARY KEY (`kodeAfd`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `m_blok` (`id` INTEGER, `kodePsa` TEXT, `kodeAfd` TEXT, `kodeBlok` TEXT, `namaBlok` TEXT, `tahunTanam` TEXT, `luasArealTanam` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_apel_pagi` (`id` INTEGER, `tanggal` TEXT, `unitKerja` TEXT, `afd` TEXT, `foto` TEXT, `createdBy` TEXT, `long` TEXT, `lat` TEXT, `isSend` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_inspeksi_hanca` (`id` INTEGER, `tanggal` TEXT, `unitKerja` TEXT, `afd` TEXT, `foto` TEXT, `blok` TEXT, `tahunTanam` INTEGER, `kapveld` INTEGER, `mandor` TEXT, `pemanen` TEXT, `brondolanTidakDikutip` INTEGER, `buahBusuk` INTEGER, `buahLewatMarangTidakDipanen` INTEGER, `buahLewatMatangTidakDiangkutKeTph` INTEGER, `pelepahTidakDipotongTiga` INTEGER, `pelepahTidakDiturunkan` INTEGER, `createdBy` TEXT, `long` TEXT, `lat` TEXT, `isSend` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_inspeksi_tph` (`id` INTEGER, `tanggal` TEXT, `unitKerja` TEXT, `afd` TEXT, `foto` TEXT, `blok` TEXT, `tahunTanam` INTEGER, `kapveld` INTEGER, `mandor` TEXT, `pemanen` TEXT, `noTph` INTEGER, `panenBuahSangatMentah` INTEGER, `tbsBusuk` INTEGER, `gagangTandanPanjang` INTEGER, `tbsTidakDiberiNomor` INTEGER, `tbsTidakDisusunRapi` INTEGER, `tangkaiTidakBerbentukV` INTEGER, `createdBy` TEXT, `long` TEXT, `lat` TEXT, `isSend` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_pencurian_tbs` (`id` INTEGER, `tanggal` TEXT, `mobileCreatedAt` TEXT, `unitKerja` TEXT, `afd` TEXT, `foto` TEXT, `blok` TEXT, `tahunTanam` INTEGER, `realisasiPencurianTbsTandan` INTEGER, `realisasiPencurianTbsKg` INTEGER, `brondolan` INTEGER, `rtl` TEXT, `createdBy` TEXT, `long` TEXT, `lat` TEXT, `isSend` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_lap_kerusakan` (`id` INTEGER, `tanggal` TEXT, `unitKerja` TEXT, `afd` TEXT, `foto` TEXT, `createdBy` TEXT, `long` TEXT, `lat` TEXT, `keterangan` TEXT, `rencana_tindaklanjut` TEXT, `isSend` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `m_mandor` (`nikSap` TEXT, `namaMandor` TEXT, `kodeAfd` TEXT, PRIMARY KEY (`nikSap`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `m_pemanen` (`nikSapPemanen` TEXT, `namaPemanen` TEXT, `nikSapMandor` TEXT, PRIMARY KEY (`nikSapPemanen`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_pemupukan` (`id` INTEGER, `tanggal` TEXT, `createdBy` TEXT, `unitKerja` TEXT, `afdeling` TEXT, `luas` TEXT, `rencanaLuasPemupukan` INTEGER, `realisasiLuasPemupukan` INTEGER, `penyebab` TEXT, `rtl` TEXT, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `isSend` INTEGER, `foto` TEXT, `hasRtl` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_penyiangan` (`id` INTEGER, `tanggal` TEXT, `createdBy` TEXT, `afdeling` TEXT, `unitKerja` TEXT, `luas` TEXT, `rencanaLuasPenyiangan` INTEGER, `realisasiLuasPenyiangan` INTEGER, `penyebab` TEXT, `rtl` TEXT, `foto` TEXT, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `isSend` INTEGER, `hasRtl` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_penunasan` (`id` INTEGER, `tanggal` TEXT, `createdBy` TEXT, `afdeling` TEXT, `unitKerja` TEXT, `luas` TEXT, `rencanaLuasPenunasan` INTEGER, `realisasiLuasPenunasan` INTEGER, `penyebab` TEXT, `rtl` TEXT, `foto` TEXT, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `isSend` INTEGER, `hasRtl` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_restan` (`id` INTEGER, `tanggal` TEXT, `unitKerja` TEXT, `afdeling` TEXT, `jmlTandanDipanen` INTEGER, `jmlTandanDiangkut` INTEGER, `restanHi` INTEGER, `restanKemarin` INTEGER, `restanTotal` INTEGER, `ketKendala` TEXT, `ketTindakLanjut` TEXT, `kapasitasAngkutanPerton` INTEGER, `kebutuhanArmadaAngkut` INTEGER, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `createdBy` TEXT, `isSend` INTEGER, `hasRtl` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_pemeliharaan_jalan` (`id` INTEGER, `tanggal` TEXT, `createdBy` TEXT, `afdeling` TEXT, `unitKerja` TEXT, `rencanaluaspemeliharaanjalan` INTEGER, `realisasiluaspemeliharaanjalan` INTEGER, `penyebab` TEXT, `rtl` TEXT, `foto` TEXT, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `hasRtl` INTEGER, `isSend` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_pengendalian_hama` (`id` INTEGER, `tanggal` TEXT, `createdBy` TEXT, `unitKerja` TEXT, `afdeling` TEXT, `luas` TEXT, `rencanaLuasPengendalianHama` INTEGER, `realisasiLuasPengendalianHama` INTEGER, `penyebab` TEXT, `rtl` TEXT, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `isSend` INTEGER, `foto` TEXT, `hasRtl` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_real_pusingan_panen` (`id` INTEGER, `tanggal` TEXT, `createdBy` TEXT, `afdeling` TEXT, `unitKerja` TEXT, `blok` TEXT, `tahunTanam` INTEGER, `rotasipanen` INTEGER, `normapusingan` INTEGER, `pusingan9hari` INTEGER, `pusingan10hari` INTEGER, `pusingan11hari` INTEGER, `pusingan12harilebih` INTEGER, `penyebab` TEXT, `rtl` TEXT, `lat` TEXT, `long` TEXT, `mobileCreatedAt` TEXT, `isSend` INTEGER, `hasRtl` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `t_apel_pagi_pengolahan` (`id` INTEGER, `rowstamp` TEXT, `tanggal` TEXT, `unitKerja` TEXT, `jenisApel` TEXT, `jamMulai` TEXT, `jamSelesai` TEXT, `latMulai` REAL, `longMulai` REAL, `latSelesai` REAL, `longSelesai` REAL, `keterangan` TEXT, `createdBy` TEXT, `createdAt` TEXT, `updatedBy` TEXT, `updatedAt` TEXT, `foto` TEXT, `isSend` INTEGER, PRIMARY KEY (`id`))');

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

  @override
  TInspeksiHancaDao get tInspeksiHancaDao {
    return _tInspeksiHancaDaoInstance ??=
        _$TInspeksiHancaDao(database, changeListener);
  }

  @override
  TInspeksiTphDao get tInspeksiTphDao {
    return _tInspeksiTphDaoInstance ??=
        _$TInspeksiTphDao(database, changeListener);
  }

  @override
  TPencurianTbsDao get tPencurianTbsDao {
    return _tPencurianTbsDaoInstance ??=
        _$TPencurianTbsDao(database, changeListener);
  }

  @override
  TLapKerusakanDao get tLapKerusakanDao {
    return _tLapKerusakanDaoInstance ??=
        _$TLapKerusakanDao(database, changeListener);
  }

  @override
  MandorDao get mandorDao {
    return _mandorDaoInstance ??= _$MandorDao(database, changeListener);
  }

  @override
  PemanenDao get pemanenDao {
    return _pemanenDaoInstance ??= _$PemanenDao(database, changeListener);
  }

  @override
  TRealPemupukanDao get tRealPemupukanDao {
    return _tRealPemupukanDaoInstance ??=
        _$TRealPemupukanDao(database, changeListener);
  }

  @override
  TRealPenyianganDao get tRealPenyianganDao {
    return _tRealPenyianganDaoInstance ??=
        _$TRealPenyianganDao(database, changeListener);
  }

  @override
  TRealPenunasanDao get tRealPenunasanDao {
    return _tRealPenunasanDaoInstance ??=
        _$TRealPenunasanDao(database, changeListener);
  }

  @override
  TRealRestanDao get tRealRestanDao {
    return _tRealRestanDaoInstance ??=
        _$TRealRestanDao(database, changeListener);
  }

  @override
  TRealPemeliharaanJalanDao get tRealPemeliharaanJalanDao {
    return _tRealPemeliharaanJalanDaoInstance ??=
        _$TRealPemeliharaanJalanDao(database, changeListener);
  }

  @override
  TRealPengendalianHamaDao get tRealPengendalianHamaDao {
    return _tRealPengendalianHamaDaoInstance ??=
        _$TRealPengendalianHamaDao(database, changeListener);
  }

  @override
  TRealPusinganPanenDao get tRealPusinganPanenDao {
    return _tRealPusinganPanenDaoInstance ??=
        _$TRealPusinganPanenDao(database, changeListener);
  }

  @override
  TApelPagiPengolahanDao get tApelPagiPengolahanDao {
    return _tApelPagiPengolahanDaoInstance ??=
        _$TApelPagiPengolahanDao(database, changeListener);
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
                  'psa_tipe': item.psa_tipe,
                  'role': item.role,
                  'token': item.token,
                  'foto': item.foto,
                  'hasSawit': item.hasSawit,
                  'hasKaret': item.hasKaret,
                  'hasTeh': item.hasTeh,
                  'hasTebu': item.hasTebu,
                  'hasKopi': item.hasKopi
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  @override
  Future<UserModel?> getUserByNikSAP(String nikSap) async {
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
            psa_tipe: row['psa_tipe'] as String?,
            role: row['role'] as String?,
            token: row['token'] as String?,
            foto: row['foto'] as String?,
            hasSawit: row['hasSawit'] as int?,
            hasKaret: row['hasKaret'] as int?,
            hasTebu: row['hasTebu'] as int?,
            hasKopi: row['hasKopi'] as int?,
            hasTeh: row['hasTeh'] as int?),
        arguments: [nikSap]);
  }

  @override
  Future<bool?> deleteUserByNikSAP(String nikSap) async {
    return _queryAdapter.query('DELETE FROM user WHERE nik_sap=?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [nikSap]);
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
                  'id': item.id,
                  'kodePsa': item.kodePsa,
                  'kodeAfd': item.kodeAfd,
                  'kodeBlok': item.kodeBlok,
                  'namaBlok': item.namaBlok,
                  'tahunTanam': item.tahunTanam,
                  'luasArealTanam': item.luasArealTanam
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BlokModel> _blokModelInsertionAdapter;

  @override
  Future<List<BlokModel>> getBlokByPsa(String psa) async {
    return _queryAdapter.queryList('SELECT * FROM m_blok WHERE kodePsa = ?1',
        mapper: (Map<String, Object?> row) => BlokModel(
            kodePsa: row['kodePsa'] as String?,
            kodeAfd: row['kodeAfd'] as String?,
            kodeBlok: row['kodeBlok'] as String?,
            namaBlok: row['namaBlok'] as String?,
            tahunTanam: row['tahunTanam'] as String?,
            luasArealTanam: row['luasArealTanam'] as String?),
        arguments: [psa]);
  }

  @override
  Future<List<BlokModel>> getAfdByPsaAndAfd(
    String psa,
    String afd,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM m_blok WHERE kodePsa = ?1 and kodeAfd = ?2',
        mapper: (Map<String, Object?> row) => BlokModel(
            kodePsa: row['kodePsa'] as String?,
            kodeAfd: row['kodeAfd'] as String?,
            kodeBlok: row['kodeBlok'] as String?,
            namaBlok: row['namaBlok'] as String?,
            tahunTanam: row['tahunTanam'] as String?,
            luasArealTanam: row['luasArealTanam'] as String?),
        arguments: [psa, afd]);
  }

  @override
  Future<List<BlokModel>> getAfdByPsaAndAfdFilter(
    String psa,
    String afd,
    String filter,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM m_blok WHERE kodePsa = ?1 and kodeAfd = ?2 and kodeBlok like %?3%',
        mapper: (Map<String, Object?> row) => BlokModel(kodePsa: row['kodePsa'] as String?, kodeAfd: row['kodeAfd'] as String?, kodeBlok: row['kodeBlok'] as String?, namaBlok: row['namaBlok'] as String?, tahunTanam: row['tahunTanam'] as String?, luasArealTanam: row['luasArealTanam'] as String?),
        arguments: [psa, afd, filter]);
  }

  @override
  Future<List<BlokModel>> getAllBlok() async {
    return _queryAdapter.queryList('SELECT * FROM m_blok',
        mapper: (Map<String, Object?> row) => BlokModel(
            kodePsa: row['kodePsa'] as String?,
            kodeAfd: row['kodeAfd'] as String?,
            kodeBlok: row['kodeBlok'] as String?,
            namaBlok: row['namaBlok'] as String?,
            tahunTanam: row['tahunTanam'] as String?,
            luasArealTanam: row['luasArealTanam'] as String?));
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
                  'unitKerja': item.unitKerja,
                  'afd': item.afd,
                  'foto': item.foto,
                  'createdBy': item.createdBy,
                  'long': item.long,
                  'lat': item.lat,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ApelPagiFormModel> _apelPagiFormModelInsertionAdapter;

  @override
  Future<List<ApelPagiFormModel>> getDataApelPagiByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_apel_pagi WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => ApelPagiFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, unitKerja: row['unitKerja'] as String?, afd: row['afd'] as String?, foto: row['foto'] as String?, createdBy: row['createdBy'] as String?, long: row['long'] as String?, lat: row['lat'] as String?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<ApelPagiFormModel>> getAllApelPagi() async {
    return _queryAdapter.queryList('SELECT * FROM t_apel_pagi',
        mapper: (Map<String, Object?> row) => ApelPagiFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            foto: row['foto'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_apel_pagi where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<ApelPagiFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList('SELECT * FROM t_apel_pagi where isSend = 0',
        mapper: (Map<String, Object?> row) => ApelPagiFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            foto: row['foto'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_apel_pagi where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataAPelPagi() async {
    return _queryAdapter.query('DELETE FROM t_apel_pagi',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataAPelPagiByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_apel_pagi WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataApelPagi(ApelPagiFormModel data) async {
    await _apelPagiFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TInspeksiHancaDao extends TInspeksiHancaDao {
  _$TInspeksiHancaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _inspeksiHancaFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_inspeksi_hanca',
            (InspeksiHancaFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'unitKerja': item.unitKerja,
                  'afd': item.afd,
                  'foto': item.foto,
                  'blok': item.blok,
                  'tahunTanam': item.tahunTanam,
                  'kapveld': item.kapveld,
                  'mandor': item.mandor,
                  'pemanen': item.pemanen,
                  'brondolanTidakDikutip': item.brondolanTidakDikutip,
                  'buahBusuk': item.buahBusuk,
                  'buahLewatMarangTidakDipanen':
                      item.buahLewatMarangTidakDipanen,
                  'buahLewatMatangTidakDiangkutKeTph':
                      item.buahLewatMatangTidakDiangkutKeTph,
                  'pelepahTidakDipotongTiga': item.pelepahTidakDipotongTiga,
                  'pelepahTidakDiturunkan': item.pelepahTidakDiturunkan,
                  'createdBy': item.createdBy,
                  'long': item.long,
                  'lat': item.lat,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<InspeksiHancaFormModel>
      _inspeksiHancaFormModelInsertionAdapter;

  @override
  Future<List<InspeksiHancaFormModel>> getDataInspeksiHancaByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_inspeksi_hanca WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => InspeksiHancaFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, unitKerja: row['unitKerja'] as String?, afd: row['afd'] as String?, blok: row['blok'] as String?, tahunTanam: row['tahunTanam'] as int?, kapveld: row['kapveld'] as int?, mandor: row['mandor'] as String?, pemanen: row['pemanen'] as String?, brondolanTidakDikutip: row['brondolanTidakDikutip'] as int?, buahBusuk: row['buahBusuk'] as int?, buahLewatMarangTidakDipanen: row['buahLewatMarangTidakDipanen'] as int?, buahLewatMatangTidakDiangkutKeTph: row['buahLewatMatangTidakDiangkutKeTph'] as int?, pelepahTidakDipotongTiga: row['pelepahTidakDipotongTiga'] as int?, pelepahTidakDiturunkan: row['pelepahTidakDiturunkan'] as int?, createdBy: row['createdBy'] as String?, long: row['long'] as String?, lat: row['lat'] as String?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<InspeksiHancaFormModel>> getAllInspeksiHanca() async {
    return _queryAdapter.queryList('SELECT * FROM t_inspeksi_hanca',
        mapper: (Map<String, Object?> row) => InspeksiHancaFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            kapveld: row['kapveld'] as int?,
            mandor: row['mandor'] as String?,
            pemanen: row['pemanen'] as String?,
            brondolanTidakDikutip: row['brondolanTidakDikutip'] as int?,
            buahBusuk: row['buahBusuk'] as int?,
            buahLewatMarangTidakDipanen:
                row['buahLewatMarangTidakDipanen'] as int?,
            buahLewatMatangTidakDiangkutKeTph:
                row['buahLewatMatangTidakDiangkutKeTph'] as int?,
            pelepahTidakDipotongTiga: row['pelepahTidakDipotongTiga'] as int?,
            pelepahTidakDiturunkan: row['pelepahTidakDiturunkan'] as int?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_inspeksi_hanca where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_inspeksi_hanca where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<List<InspeksiHancaFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_inspeksi_hanca where isSend = 0',
        mapper: (Map<String, Object?> row) => InspeksiHancaFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            kapveld: row['kapveld'] as int?,
            mandor: row['mandor'] as String?,
            pemanen: row['pemanen'] as String?,
            brondolanTidakDikutip: row['brondolanTidakDikutip'] as int?,
            buahBusuk: row['buahBusuk'] as int?,
            buahLewatMarangTidakDipanen:
                row['buahLewatMarangTidakDipanen'] as int?,
            buahLewatMatangTidakDiangkutKeTph:
                row['buahLewatMatangTidakDiangkutKeTph'] as int?,
            pelepahTidakDipotongTiga: row['pelepahTidakDipotongTiga'] as int?,
            pelepahTidakDiturunkan: row['pelepahTidakDiturunkan'] as int?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataInspeksiHanca() async {
    return _queryAdapter.query('DELETE FROM t_inspeksi_hanca',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataInspeksiHancaByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_inspeksi_hanca WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataInspeksiHanca(InspeksiHancaFormModel data) async {
    await _inspeksiHancaFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TInspeksiTphDao extends TInspeksiTphDao {
  _$TInspeksiTphDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _inspeksiTphFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_inspeksi_tph',
            (InspeksiTphFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'unitKerja': item.unitKerja,
                  'afd': item.afd,
                  'foto': item.foto,
                  'blok': item.blok,
                  'tahunTanam': item.tahunTanam,
                  'kapveld': item.kapveld,
                  'mandor': item.mandor,
                  'pemanen': item.pemanen,
                  'noTph': item.noTph,
                  'panenBuahSangatMentah': item.panenBuahSangatMentah,
                  'tbsBusuk': item.tbsBusuk,
                  'gagangTandanPanjang': item.gagangTandanPanjang,
                  'tbsTidakDiberiNomor': item.tbsTidakDiberiNomor,
                  'tbsTidakDisusunRapi': item.tbsTidakDisusunRapi,
                  'tangkaiTidakBerbentukV': item.tangkaiTidakBerbentukV,
                  'createdBy': item.createdBy,
                  'long': item.long,
                  'lat': item.lat,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<InspeksiTphFormModel>
      _inspeksiTphFormModelInsertionAdapter;

  @override
  Future<List<InspeksiTphFormModel>> getDataInspeksiTphByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_inspeksi_tph WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => InspeksiTphFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, unitKerja: row['unitKerja'] as String?, afd: row['afd'] as String?, blok: row['blok'] as String?, tahunTanam: row['tahunTanam'] as int?, kapveld: row['kapveld'] as int?, mandor: row['mandor'] as String?, pemanen: row['pemanen'] as String?, noTph: row['noTph'] as int?, panenBuahSangatMentah: row['panenBuahSangatMentah'] as int?, tbsBusuk: row['tbsBusuk'] as int?, gagangTandanPanjang: row['gagangTandanPanjang'] as int?, tbsTidakDiberiNomor: row['tbsTidakDiberiNomor'] as int?, tbsTidakDisusunRapi: row['tbsTidakDisusunRapi'] as int?, tangkaiTidakBerbentukV: row['tangkaiTidakBerbentukV'] as int?, createdBy: row['createdBy'] as String?, long: row['long'] as String?, lat: row['lat'] as String?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<InspeksiTphFormModel>> getAllInspeksiTph() async {
    return _queryAdapter.queryList('SELECT * FROM t_inspeksi_tph',
        mapper: (Map<String, Object?> row) => InspeksiTphFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            kapveld: row['kapveld'] as int?,
            mandor: row['mandor'] as String?,
            pemanen: row['pemanen'] as String?,
            noTph: row['noTph'] as int?,
            panenBuahSangatMentah: row['panenBuahSangatMentah'] as int?,
            tbsBusuk: row['tbsBusuk'] as int?,
            gagangTandanPanjang: row['gagangTandanPanjang'] as int?,
            tbsTidakDiberiNomor: row['tbsTidakDiberiNomor'] as int?,
            tbsTidakDisusunRapi: row['tbsTidakDisusunRapi'] as int?,
            tangkaiTidakBerbentukV: row['tangkaiTidakBerbentukV'] as int?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_inspeksi_tph where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_inspeksi_tph where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<List<InspeksiTphFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_inspeksi_tph where isSend = 0',
        mapper: (Map<String, Object?> row) => InspeksiTphFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            kapveld: row['kapveld'] as int?,
            mandor: row['mandor'] as String?,
            pemanen: row['pemanen'] as String?,
            noTph: row['noTph'] as int?,
            panenBuahSangatMentah: row['panenBuahSangatMentah'] as int?,
            tbsBusuk: row['tbsBusuk'] as int?,
            gagangTandanPanjang: row['gagangTandanPanjang'] as int?,
            tbsTidakDiberiNomor: row['tbsTidakDiberiNomor'] as int?,
            tbsTidakDisusunRapi: row['tbsTidakDisusunRapi'] as int?,
            tangkaiTidakBerbentukV: row['tangkaiTidakBerbentukV'] as int?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataInspeksiTph() async {
    return _queryAdapter.query('DELETE FROM t_inspeksi_tph',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataInspeksiTphByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_inspeksi_tph WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataInspeksiTph(InspeksiTphFormModel data) async {
    await _inspeksiTphFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TPencurianTbsDao extends TPencurianTbsDao {
  _$TPencurianTbsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pencurianTbsFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_pencurian_tbs',
            (PencurianTbsFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'unitKerja': item.unitKerja,
                  'afd': item.afd,
                  'foto': item.foto,
                  'blok': item.blok,
                  'tahunTanam': item.tahunTanam,
                  'realisasiPencurianTbsTandan':
                      item.realisasiPencurianTbsTandan,
                  'realisasiPencurianTbsKg': item.realisasiPencurianTbsKg,
                  'brondolan': item.brondolan,
                  'rtl': item.rtl,
                  'createdBy': item.createdBy,
                  'long': item.long,
                  'lat': item.lat,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PencurianTbsFormModel>
      _pencurianTbsFormModelInsertionAdapter;

  @override
  Future<List<PencurianTbsFormModel>> getDataPencurianTbsByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_pencurian_tbs WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => PencurianTbsFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, unitKerja: row['unitKerja'] as String?, afd: row['afd'] as String?, blok: row['blok'] as String?, tahunTanam: row['tahunTanam'] as int?, realisasiPencurianTbsTandan: row['realisasiPencurianTbsTandan'] as int?, realisasiPencurianTbsKg: row['realisasiPencurianTbsKg'] as int?, brondolan: row['brondolan'] as int?, foto: row['foto'] as String?, rtl: row['rtl'] as String?, createdBy: row['createdBy'] as String?, long: row['long'] as String?, lat: row['lat'] as String?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<PencurianTbsFormModel>> getAllPencurianTbs() async {
    return _queryAdapter.queryList('SELECT * FROM t_pencurian_tbs',
        mapper: (Map<String, Object?> row) => PencurianTbsFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            realisasiPencurianTbsTandan:
                row['realisasiPencurianTbsTandan'] as int?,
            realisasiPencurianTbsKg: row['realisasiPencurianTbsKg'] as int?,
            brondolan: row['brondolan'] as int?,
            foto: row['foto'] as String?,
            rtl: row['rtl'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_pencurian_tbs where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<PencurianTbsFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_pencurian_tbs where isSend = 0',
        mapper: (Map<String, Object?> row) => PencurianTbsFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            realisasiPencurianTbsTandan:
                row['realisasiPencurianTbsTandan'] as int?,
            realisasiPencurianTbsKg: row['realisasiPencurianTbsKg'] as int?,
            brondolan: row['brondolan'] as int?,
            foto: row['foto'] as String?,
            rtl: row['rtl'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_pencurian_tbs where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataWhichHasSend() async {
    return _queryAdapter.query('DELETE FROM t_pencurian_tbs where isSend = 1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataPencurianTbs() async {
    return _queryAdapter.query('DELETE FROM t_pencurian_tbs',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataPencurianTbsByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_pencurian_tbs WHERE date(tanggal) = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataPencurianTbs(PencurianTbsFormModel data) async {
    await _pencurianTbsFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TLapKerusakanDao extends TLapKerusakanDao {
  _$TLapKerusakanDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _lapKerusakanFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_lap_kerusakan',
            (LapKerusakanFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'unitKerja': item.unitKerja,
                  'afd': item.afd,
                  'foto': item.foto,
                  'createdBy': item.createdBy,
                  'long': item.long,
                  'lat': item.lat,
                  'keterangan': item.keterangan,
                  'rencana_tindaklanjut': item.rencana_tindaklanjut,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LapKerusakanFormModel>
      _lapKerusakanFormModelInsertionAdapter;

  @override
  Future<List<LapKerusakanFormModel>> getDataLapKerusakanByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_lap_kerusakan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => LapKerusakanFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, unitKerja: row['unitKerja'] as String?, afd: row['afd'] as String?, foto: row['foto'] as String?, createdBy: row['createdBy'] as String?, long: row['long'] as String?, lat: row['lat'] as String?, keterangan: row['keterangan'] as String?, rencana_tindaklanjut: row['rencana_tindaklanjut'] as String?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<LapKerusakanFormModel>> getAllLapKerusakan() async {
    return _queryAdapter.queryList('SELECT * FROM t_lap_kerusakan',
        mapper: (Map<String, Object?> row) => LapKerusakanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            foto: row['foto'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            keterangan: row['keterangan'] as String?,
            rencana_tindaklanjut: row['rencana_tindaklanjut'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_lap_kerusakan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<LapKerusakanFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_lap_kerusakan where isSend = 0',
        mapper: (Map<String, Object?> row) => LapKerusakanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afd: row['afd'] as String?,
            foto: row['foto'] as String?,
            createdBy: row['createdBy'] as String?,
            long: row['long'] as String?,
            lat: row['lat'] as String?,
            keterangan: row['keterangan'] as String?,
            rencana_tindaklanjut: row['rencana_tindaklanjut'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_lap_kerusakan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataLapKerusakan() async {
    return _queryAdapter.query('DELETE FROM t_lap_kerusakan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataLapKerusakanByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_lap_kerusakan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataLapKerusakan(LapKerusakanFormModel data) async {
    await _lapKerusakanFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$MandorDao extends MandorDao {
  _$MandorDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _mandorModelInsertionAdapter = InsertionAdapter(
            database,
            'm_mandor',
            (MandorModel item) => <String, Object?>{
                  'nikSap': item.nikSap,
                  'namaMandor': item.namaMandor,
                  'kodeAfd': item.kodeAfd
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MandorModel> _mandorModelInsertionAdapter;

  @override
  Future<List<MandorModel>> getMandorByPsa(String psa) async {
    return _queryAdapter.queryList('SELECT * FROM m_mandor WHERE kodePsa = ?1',
        mapper: (Map<String, Object?> row) => MandorModel(
            nikSap: row['nikSap'] as String?,
            namaMandor: row['namaMandor'] as String?,
            kodeAfd: row['kodeAfd'] as String?),
        arguments: [psa]);
  }

  @override
  Future<List<MandorModel>> getAfdByPsaAndAfd(
    String psa,
    String afd,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM m_mandor WHERE kodePsa = ?1 and kodeAfd = ?2',
        mapper: (Map<String, Object?> row) => MandorModel(
            nikSap: row['nikSap'] as String?,
            namaMandor: row['namaMandor'] as String?,
            kodeAfd: row['kodeAfd'] as String?),
        arguments: [psa, afd]);
  }

  @override
  Future<List<MandorModel>> getAllMandor() async {
    return _queryAdapter.queryList('SELECT * FROM m_mandor',
        mapper: (Map<String, Object?> row) => MandorModel(
            nikSap: row['nikSap'] as String?,
            namaMandor: row['namaMandor'] as String?,
            kodeAfd: row['kodeAfd'] as String?));
  }

  @override
  Future<bool?> deleteMandor() async {
    return _queryAdapter.query('DELETE FROM m_mandor',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertMandor(MandorModel mandor) async {
    await _mandorModelInsertionAdapter.insert(
        mandor, OnConflictStrategy.replace);
  }
}

class _$PemanenDao extends PemanenDao {
  _$PemanenDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pemanenModelInsertionAdapter = InsertionAdapter(
            database,
            'm_pemanen',
            (PemanenModel item) => <String, Object?>{
                  'nikSapPemanen': item.nikSapPemanen,
                  'namaPemanen': item.namaPemanen,
                  'nikSapMandor': item.nikSapMandor
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PemanenModel> _pemanenModelInsertionAdapter;

  @override
  Future<List<PemanenModel>> getPemanenByPsa(String psa) async {
    return _queryAdapter.queryList('SELECT * FROM m_pemanen WHERE kodePsa = ?1',
        mapper: (Map<String, Object?> row) => PemanenModel(
            nikSapPemanen: row['nikSapPemanen'] as String?,
            namaPemanen: row['namaPemanen'] as String?,
            nikSapMandor: row['nikSapMandor'] as String?),
        arguments: [psa]);
  }

  @override
  Future<List<PemanenModel>> getPemanenByMandor(String nikMandor) async {
    return _queryAdapter.queryList(
        'SELECT * FROM m_pemanen WHERE nikSapMandor = ?1',
        mapper: (Map<String, Object?> row) => PemanenModel(
            nikSapPemanen: row['nikSapPemanen'] as String?,
            namaPemanen: row['namaPemanen'] as String?,
            nikSapMandor: row['nikSapMandor'] as String?),
        arguments: [nikMandor]);
  }

  @override
  Future<List<PemanenModel>> getAfdByPsaAndAfd(
    String psa,
    String afd,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM m_pemanen WHERE kodePsa = ?1 and kodeAfd = ?2',
        mapper: (Map<String, Object?> row) => PemanenModel(
            nikSapPemanen: row['nikSapPemanen'] as String?,
            namaPemanen: row['namaPemanen'] as String?,
            nikSapMandor: row['nikSapMandor'] as String?),
        arguments: [psa, afd]);
  }

  @override
  Future<List<PemanenModel>> getAllPemanen() async {
    return _queryAdapter.queryList('SELECT * FROM m_pemanen',
        mapper: (Map<String, Object?> row) => PemanenModel(
            nikSapPemanen: row['nikSapPemanen'] as String?,
            namaPemanen: row['namaPemanen'] as String?,
            nikSapMandor: row['nikSapMandor'] as String?));
  }

  @override
  Future<bool?> deletePemanen() async {
    return _queryAdapter.query('DELETE FROM m_pemanen',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertPemanen(PemanenModel pemanen) async {
    await _pemanenModelInsertionAdapter.insert(
        pemanen, OnConflictStrategy.replace);
  }
}

class _$TRealPemupukanDao extends TRealPemupukanDao {
  _$TRealPemupukanDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realPemupukanFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_pemupukan',
            (RealPemupukanFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'createdBy': item.createdBy,
                  'unitKerja': item.unitKerja,
                  'afdeling': item.afdeling,
                  'luas': item.luas,
                  'rencanaLuasPemupukan': item.rencanaLuasPemupukan,
                  'realisasiLuasPemupukan': item.realisasiLuasPemupukan,
                  'penyebab': item.penyebab,
                  'rtl': item.rtl,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'isSend': item.isSend,
                  'foto': item.foto,
                  'hasRtl': item.hasRtl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealPemupukanFormModel>
      _realPemupukanFormModelInsertionAdapter;

  @override
  Future<List<RealPemupukanFormModel>> getDataRealPemupukanByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pemupukan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealPemupukanFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, createdBy: row['createdBy'] as String?, unitKerja: row['unitKerja'] as String?, afdeling: row['afdeling'] as String?, luas: row['luas'] as String?, rencanaLuasPemupukan: row['rencanaLuasPemupukan'] as int?, realisasiLuasPemupukan: row['realisasiLuasPemupukan'] as int?, penyebab: row['penyebab'] as String?, rtl: row['rtl'] as String?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, isSend: row['isSend'] as int?, foto: row['foto'] as String?, hasRtl: row['hasRtl'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealPemupukanFormModel>> getAllRealPemupukan() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_pemupukan',
        mapper: (Map<String, Object?> row) => RealPemupukanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afdeling: row['afdeling'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPemupukan: row['rencanaLuasPemupukan'] as int?,
            realisasiLuasPemupukan: row['realisasiLuasPemupukan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            foto: row['foto'] as String?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_pemupukan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealPemupukanFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pemupukan where isSend = 0',
        mapper: (Map<String, Object?> row) => RealPemupukanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afdeling: row['afdeling'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPemupukan: row['rencanaLuasPemupukan'] as int?,
            realisasiLuasPemupukan: row['realisasiLuasPemupukan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            foto: row['foto'] as String?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_real_pemupukan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealPemupukan() async {
    return _queryAdapter.query('DELETE FROM t_real_pemupukan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealPemupukanByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pemupukan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealPemupukan(RealPemupukanFormModel data) async {
    await _realPemupukanFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TRealPenyianganDao extends TRealPenyianganDao {
  _$TRealPenyianganDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realPenyianganFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_penyiangan',
            (RealPenyianganFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'createdBy': item.createdBy,
                  'afdeling': item.afdeling,
                  'unitKerja': item.unitKerja,
                  'luas': item.luas,
                  'rencanaLuasPenyiangan': item.rencanaLuasPenyiangan,
                  'realisasiLuasPenyiangan': item.realisasiLuasPenyiangan,
                  'penyebab': item.penyebab,
                  'rtl': item.rtl,
                  'foto': item.foto,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'isSend': item.isSend,
                  'hasRtl': item.hasRtl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealPenyianganFormModel>
      _realPenyianganFormModelInsertionAdapter;

  @override
  Future<List<RealPenyianganFormModel>> getDataRealPenyianganByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_penyiangan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealPenyianganFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, createdBy: row['createdBy'] as String?, afdeling: row['afdeling'] as String?, unitKerja: row['unitKerja'] as String?, luas: row['luas'] as String?, rencanaLuasPenyiangan: row['rencanaLuasPenyiangan'] as int?, realisasiLuasPenyiangan: row['realisasiLuasPenyiangan'] as int?, penyebab: row['penyebab'] as String?, rtl: row['rtl'] as String?, foto: row['foto'] as String?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, isSend: row['isSend'] as int?, hasRtl: row['hasRtl'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealPenyianganFormModel>> getAllRealPenyiangan() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_penyiangan',
        mapper: (Map<String, Object?> row) => RealPenyianganFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPenyiangan: row['rencanaLuasPenyiangan'] as int?,
            realisasiLuasPenyiangan: row['realisasiLuasPenyiangan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            foto: row['foto'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_penyiangan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealPenyianganFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_penyiangan where isSend = 0',
        mapper: (Map<String, Object?> row) => RealPenyianganFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPenyiangan: row['rencanaLuasPenyiangan'] as int?,
            realisasiLuasPenyiangan: row['realisasiLuasPenyiangan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            foto: row['foto'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_real_penyiangan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealPenyiangan() async {
    return _queryAdapter.query('DELETE FROM t_real_penyiangan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealPenyianganByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_penyiangan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealPenyiangan(RealPenyianganFormModel data) async {
    await _realPenyianganFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TRealPenunasanDao extends TRealPenunasanDao {
  _$TRealPenunasanDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realPenunasanFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_penunasan',
            (RealPenunasanFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'createdBy': item.createdBy,
                  'afdeling': item.afdeling,
                  'unitKerja': item.unitKerja,
                  'luas': item.luas,
                  'rencanaLuasPenunasan': item.rencanaLuasPenunasan,
                  'realisasiLuasPenunasan': item.realisasiLuasPenunasan,
                  'penyebab': item.penyebab,
                  'rtl': item.rtl,
                  'foto': item.foto,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'isSend': item.isSend,
                  'hasRtl': item.hasRtl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealPenunasanFormModel>
      _realPenunasanFormModelInsertionAdapter;

  @override
  Future<List<RealPenunasanFormModel>> getDataRealPenunasanByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_penunasan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealPenunasanFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, createdBy: row['createdBy'] as String?, afdeling: row['afdeling'] as String?, unitKerja: row['unitKerja'] as String?, luas: row['luas'] as String?, rencanaLuasPenunasan: row['rencanaLuasPenunasan'] as int?, realisasiLuasPenunasan: row['realisasiLuasPenunasan'] as int?, penyebab: row['penyebab'] as String?, rtl: row['rtl'] as String?, foto: row['foto'] as String?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, isSend: row['isSend'] as int?, hasRtl: row['hasRtl'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealPenunasanFormModel>> getAllRealPenunasan() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_penunasan',
        mapper: (Map<String, Object?> row) => RealPenunasanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPenunasan: row['rencanaLuasPenunasan'] as int?,
            realisasiLuasPenunasan: row['realisasiLuasPenunasan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            foto: row['foto'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_penunasan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealPenunasanFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_penunasan where isSend = 0',
        mapper: (Map<String, Object?> row) => RealPenunasanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPenunasan: row['rencanaLuasPenunasan'] as int?,
            realisasiLuasPenunasan: row['realisasiLuasPenunasan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            foto: row['foto'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_real_penunasan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealPenunasan() async {
    return _queryAdapter.query('DELETE FROM t_real_penunasan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealPenunasanByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_penunasan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealPenunasan(RealPenunasanFormModel data) async {
    await _realPenunasanFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TRealRestanDao extends TRealRestanDao {
  _$TRealRestanDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realRestanFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_restan',
            (RealRestanFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'unitKerja': item.unitKerja,
                  'afdeling': item.afdeling,
                  'jmlTandanDipanen': item.jmlTandanDipanen,
                  'jmlTandanDiangkut': item.jmlTandanDiangkut,
                  'restanHi': item.restanHi,
                  'restanKemarin': item.restanKemarin,
                  'restanTotal': item.restanTotal,
                  'ketKendala': item.ketKendala,
                  'ketTindakLanjut': item.ketTindakLanjut,
                  'kapasitasAngkutanPerton': item.kapasitasAngkutanPerton,
                  'kebutuhanArmadaAngkut': item.kebutuhanArmadaAngkut,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'createdBy': item.createdBy,
                  'isSend': item.isSend,
                  'hasRtl': item.hasRtl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealRestanFormModel>
      _realRestanFormModelInsertionAdapter;

  @override
  Future<List<RealRestanFormModel>> getDataRealRestanByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_restan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealRestanFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, unitKerja: row['unitKerja'] as String?, afdeling: row['afdeling'] as String?, jmlTandanDipanen: row['jmlTandanDipanen'] as int?, jmlTandanDiangkut: row['jmlTandanDiangkut'] as int?, restanHi: row['restanHi'] as int?, restanKemarin: row['restanKemarin'] as int?, restanTotal: row['restanTotal'] as int?, ketKendala: row['ketKendala'] as String?, ketTindakLanjut: row['ketTindakLanjut'] as String?, kapasitasAngkutanPerton: row['kapasitasAngkutanPerton'] as int?, kebutuhanArmadaAngkut: row['kebutuhanArmadaAngkut'] as int?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, createdBy: row['createdBy'] as String?, isSend: row['isSend'] as int?, hasRtl: row['hasRtl'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealRestanFormModel>> getAllRealRestan() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_restan',
        mapper: (Map<String, Object?> row) => RealRestanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afdeling: row['afdeling'] as String?,
            jmlTandanDipanen: row['jmlTandanDipanen'] as int?,
            jmlTandanDiangkut: row['jmlTandanDiangkut'] as int?,
            restanHi: row['restanHi'] as int?,
            restanKemarin: row['restanKemarin'] as int?,
            restanTotal: row['restanTotal'] as int?,
            ketKendala: row['ketKendala'] as String?,
            ketTindakLanjut: row['ketTindakLanjut'] as String?,
            kapasitasAngkutanPerton: row['kapasitasAngkutanPerton'] as int?,
            kebutuhanArmadaAngkut: row['kebutuhanArmadaAngkut'] as int?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            createdBy: row['createdBy'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_restan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealRestanFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_restan where isSend = 0',
        mapper: (Map<String, Object?> row) => RealRestanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afdeling: row['afdeling'] as String?,
            jmlTandanDipanen: row['jmlTandanDipanen'] as int?,
            jmlTandanDiangkut: row['jmlTandanDiangkut'] as int?,
            restanHi: row['restanHi'] as int?,
            restanKemarin: row['restanKemarin'] as int?,
            restanTotal: row['restanTotal'] as int?,
            ketKendala: row['ketKendala'] as String?,
            ketTindakLanjut: row['ketTindakLanjut'] as String?,
            kapasitasAngkutanPerton: row['kapasitasAngkutanPerton'] as int?,
            kebutuhanArmadaAngkut: row['kebutuhanArmadaAngkut'] as int?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            createdBy: row['createdBy'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query('DELETE FROM t_real_restan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealRestan() async {
    return _queryAdapter.query('DELETE FROM t_real_restan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealRestanByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_restan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealRestan(RealRestanFormModel data) async {
    await _realRestanFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TRealPemeliharaanJalanDao extends TRealPemeliharaanJalanDao {
  _$TRealPemeliharaanJalanDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realPemeliharaanJalanFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_pemeliharaan_jalan',
            (RealPemeliharaanJalanFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'createdBy': item.createdBy,
                  'afdeling': item.afdeling,
                  'unitKerja': item.unitKerja,
                  'rencanaluaspemeliharaanjalan':
                      item.rencanaluaspemeliharaanjalan,
                  'realisasiluaspemeliharaanjalan':
                      item.realisasiluaspemeliharaanjalan,
                  'penyebab': item.penyebab,
                  'rtl': item.rtl,
                  'foto': item.foto,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'hasRtl': item.hasRtl,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealPemeliharaanJalanFormModel>
      _realPemeliharaanJalanFormModelInsertionAdapter;

  @override
  Future<List<RealPemeliharaanJalanFormModel>>
      getDataRealPemeliharaanJalanByTanggal(String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pemeliharaan_jalan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealPemeliharaanJalanFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, createdBy: row['createdBy'] as String?, afdeling: row['afdeling'] as String?, unitKerja: row['unitKerja'] as String?, rencanaluaspemeliharaanjalan: row['rencanaluaspemeliharaanjalan'] as int?, realisasiluaspemeliharaanjalan: row['realisasiluaspemeliharaanjalan'] as int?, penyebab: row['penyebab'] as String?, rtl: row['rtl'] as String?, foto: row['foto'] as String?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, hasRtl: row['hasRtl'] as int?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealPemeliharaanJalanFormModel>>
      getAllRealPemeliharaanJalan() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_pemeliharaan_jalan',
        mapper: (Map<String, Object?> row) => RealPemeliharaanJalanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            rencanaluaspemeliharaanjalan:
                row['rencanaluaspemeliharaanjalan'] as int?,
            realisasiluaspemeliharaanjalan:
                row['realisasiluaspemeliharaanjalan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            foto: row['foto'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            hasRtl: row['hasRtl'] as int?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_pemeliharaan_jalan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealPemeliharaanJalanFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pemeliharaan_jalan where isSend = 0',
        mapper: (Map<String, Object?> row) => RealPemeliharaanJalanFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            rencanaluaspemeliharaanjalan:
                row['rencanaluaspemeliharaanjalan'] as int?,
            realisasiluaspemeliharaanjalan:
                row['realisasiluaspemeliharaanjalan'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            foto: row['foto'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            hasRtl: row['hasRtl'] as int?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pemeliharaan_jalan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealPemeliharaanJalan() async {
    return _queryAdapter.query('DELETE FROM t_real_pemeliharaan_jalan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealPemeliharaanJalanByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pemeliharaan_jalan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealPemeliharaanJalan(
      RealPemeliharaanJalanFormModel data) async {
    await _realPemeliharaanJalanFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TRealPengendalianHamaDao extends TRealPengendalianHamaDao {
  _$TRealPengendalianHamaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realPengendalianHamaFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_pengendalian_hama',
            (RealPengendalianHamaFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'createdBy': item.createdBy,
                  'unitKerja': item.unitKerja,
                  'afdeling': item.afdeling,
                  'luas': item.luas,
                  'rencanaLuasPengendalianHama':
                      item.rencanaLuasPengendalianHama,
                  'realisasiLuasPengendalianHama':
                      item.realisasiLuasPengendalianHama,
                  'penyebab': item.penyebab,
                  'rtl': item.rtl,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'isSend': item.isSend,
                  'foto': item.foto,
                  'hasRtl': item.hasRtl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealPengendalianHamaFormModel>
      _realPengendalianHamaFormModelInsertionAdapter;

  @override
  Future<List<RealPengendalianHamaFormModel>>
      getDataRealPengendalianHamaByTanggal(String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pengendalian_hama WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealPengendalianHamaFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, createdBy: row['createdBy'] as String?, unitKerja: row['unitKerja'] as String?, afdeling: row['afdeling'] as String?, luas: row['luas'] as String?, rencanaLuasPengendalianHama: row['rencanaLuasPengendalianHama'] as int?, realisasiLuasPengendalianHama: row['realisasiLuasPengendalianHama'] as int?, penyebab: row['penyebab'] as String?, rtl: row['rtl'] as String?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, isSend: row['isSend'] as int?, foto: row['foto'] as String?, hasRtl: row['hasRtl'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealPengendalianHamaFormModel>>
      getAllRealPengendalianHama() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_pengendalian_hama',
        mapper: (Map<String, Object?> row) => RealPengendalianHamaFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afdeling: row['afdeling'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPengendalianHama:
                row['rencanaLuasPengendalianHama'] as int?,
            realisasiLuasPengendalianHama:
                row['realisasiLuasPengendalianHama'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            foto: row['foto'] as String?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_pengendalian_hama where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealPengendalianHamaFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pengendalian_hama where isSend = 0',
        mapper: (Map<String, Object?> row) => RealPengendalianHamaFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            unitKerja: row['unitKerja'] as String?,
            afdeling: row['afdeling'] as String?,
            luas: row['luas'] as String?,
            rencanaLuasPengendalianHama:
                row['rencanaLuasPengendalianHama'] as int?,
            realisasiLuasPengendalianHama:
                row['realisasiLuasPengendalianHama'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            foto: row['foto'] as String?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pengendalian_hama where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealPengendalianHama() async {
    return _queryAdapter.query('DELETE FROM t_real_pengendalian_hama',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealPengendalianHamaByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pengendalian_hama WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealPengendalianHama(
      RealPengendalianHamaFormModel data) async {
    await _realPengendalianHamaFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TRealPusinganPanenDao extends TRealPusinganPanenDao {
  _$TRealPusinganPanenDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _realPusinganPanenFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_real_pusingan_panen',
            (RealPusinganPanenFormModel item) => <String, Object?>{
                  'id': item.id,
                  'tanggal': item.tanggal,
                  'createdBy': item.createdBy,
                  'afdeling': item.afdeling,
                  'unitKerja': item.unitKerja,
                  'blok': item.blok,
                  'tahunTanam': item.tahunTanam,
                  'rotasipanen': item.rotasipanen,
                  'normapusingan': item.normapusingan,
                  'pusingan9hari': item.pusingan9hari,
                  'pusingan10hari': item.pusingan10hari,
                  'pusingan11hari': item.pusingan11hari,
                  'pusingan12harilebih': item.pusingan12harilebih,
                  'penyebab': item.penyebab,
                  'rtl': item.rtl,
                  'lat': item.lat,
                  'long': item.long,
                  'mobileCreatedAt': item.mobileCreatedAt,
                  'isSend': item.isSend,
                  'hasRtl': item.hasRtl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RealPusinganPanenFormModel>
      _realPusinganPanenFormModelInsertionAdapter;

  @override
  Future<List<RealPusinganPanenFormModel>> getDataRealPusinganPanenByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pusingan_panen WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => RealPusinganPanenFormModel(id: row['id'] as int?, tanggal: row['tanggal'] as String?, createdBy: row['createdBy'] as String?, afdeling: row['afdeling'] as String?, unitKerja: row['unitKerja'] as String?, blok: row['blok'] as String?, tahunTanam: row['tahunTanam'] as int?, rotasipanen: row['rotasipanen'] as int?, normapusingan: row['normapusingan'] as int?, pusingan9hari: row['pusingan9hari'] as int?, pusingan10hari: row['pusingan10hari'] as int?, pusingan11hari: row['pusingan11hari'] as int?, pusingan12harilebih: row['pusingan12harilebih'] as int?, penyebab: row['penyebab'] as String?, rtl: row['rtl'] as String?, lat: row['lat'] as String?, long: row['long'] as String?, mobileCreatedAt: row['mobileCreatedAt'] as String?, isSend: row['isSend'] as int?, hasRtl: row['hasRtl'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<RealPusinganPanenFormModel>> getAllRealPusinganPanen() async {
    return _queryAdapter.queryList('SELECT * FROM t_real_pusingan_panen',
        mapper: (Map<String, Object?> row) => RealPusinganPanenFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            rotasipanen: row['rotasipanen'] as int?,
            normapusingan: row['normapusingan'] as int?,
            pusingan9hari: row['pusingan9hari'] as int?,
            pusingan10hari: row['pusingan10hari'] as int?,
            pusingan11hari: row['pusingan11hari'] as int?,
            pusingan12harilebih: row['pusingan12harilebih'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_real_pusingan_panen where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RealPusinganPanenFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_real_pusingan_panen where isSend = 0',
        mapper: (Map<String, Object?> row) => RealPusinganPanenFormModel(
            id: row['id'] as int?,
            tanggal: row['tanggal'] as String?,
            createdBy: row['createdBy'] as String?,
            afdeling: row['afdeling'] as String?,
            unitKerja: row['unitKerja'] as String?,
            blok: row['blok'] as String?,
            tahunTanam: row['tahunTanam'] as int?,
            rotasipanen: row['rotasipanen'] as int?,
            normapusingan: row['normapusingan'] as int?,
            pusingan9hari: row['pusingan9hari'] as int?,
            pusingan10hari: row['pusingan10hari'] as int?,
            pusingan11hari: row['pusingan11hari'] as int?,
            pusingan12harilebih: row['pusingan12harilebih'] as int?,
            penyebab: row['penyebab'] as String?,
            rtl: row['rtl'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            mobileCreatedAt: row['mobileCreatedAt'] as String?,
            isSend: row['isSend'] as int?,
            hasRtl: row['hasRtl'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pusingan_panen where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataRealPusinganPanen() async {
    return _queryAdapter.query('DELETE FROM t_real_pusingan_panen',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataRealPusinganPanenByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_real_pusingan_panen WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataRealPusinganPanen(
      RealPusinganPanenFormModel data) async {
    await _realPusinganPanenFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}

class _$TApelPagiPengolahanDao extends TApelPagiPengolahanDao {
  _$TApelPagiPengolahanDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _apelPagiPengolahanFormModelInsertionAdapter = InsertionAdapter(
            database,
            't_apel_pagi_pengolahan',
            (ApelPagiPengolahanFormModel item) => <String, Object?>{
                  'id': item.id,
                  'rowstamp': item.rowstamp,
                  'tanggal': item.tanggal,
                  'unitKerja': item.unitKerja,
                  'jenisApel': item.jenisApel,
                  'jamMulai': item.jamMulai,
                  'jamSelesai': item.jamSelesai,
                  'latMulai': item.latMulai,
                  'longMulai': item.longMulai,
                  'latSelesai': item.latSelesai,
                  'longSelesai': item.longSelesai,
                  'keterangan': item.keterangan,
                  'createdBy': item.createdBy,
                  'createdAt': item.createdAt,
                  'updatedBy': item.updatedBy,
                  'updatedAt': item.updatedAt,
                  'foto': item.foto,
                  'isSend': item.isSend
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ApelPagiPengolahanFormModel>
      _apelPagiPengolahanFormModelInsertionAdapter;

  @override
  Future<List<ApelPagiPengolahanFormModel>> getDataApelPagiPengolahanByTanggal(
      String tanggal) async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_apel_pagi_pengolahan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => ApelPagiPengolahanFormModel(id: row['id'] as int?, rowstamp: row['rowstamp'] as String?, tanggal: row['tanggal'] as String?, unitKerja: row['unitKerja'] as String?, jenisApel: row['jenisApel'] as String?, jamMulai: row['jamMulai'] as String?, jamSelesai: row['jamSelesai'] as String?, latMulai: row['latMulai'] as double?, longMulai: row['longMulai'] as double?, latSelesai: row['latSelesai'] as double?, longSelesai: row['longSelesai'] as double?, keterangan: row['keterangan'] as String?, createdBy: row['createdBy'] as String?, createdAt: row['createdAt'] as String?, updatedBy: row['updatedBy'] as String?, updatedAt: row['updatedAt'] as String?, foto: row['foto'] as String?, isSend: row['isSend'] as int?),
        arguments: [tanggal]);
  }

  @override
  Future<List<ApelPagiPengolahanFormModel>> getAllApelPagiPengolahan() async {
    return _queryAdapter.queryList('SELECT * FROM t_apel_pagi_pengolahan',
        mapper: (Map<String, Object?> row) => ApelPagiPengolahanFormModel(
            id: row['id'] as int?,
            rowstamp: row['rowstamp'] as String?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            jenisApel: row['jenisApel'] as String?,
            jamMulai: row['jamMulai'] as String?,
            jamSelesai: row['jamSelesai'] as String?,
            latMulai: row['latMulai'] as double?,
            longMulai: row['longMulai'] as double?,
            latSelesai: row['latSelesai'] as double?,
            longSelesai: row['longSelesai'] as double?,
            keterangan: row['keterangan'] as String?,
            createdBy: row['createdBy'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedBy: row['updatedBy'] as String?,
            updatedAt: row['updatedAt'] as String?,
            foto: row['foto'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<int?> getCountNotSend() async {
    return _queryAdapter.query(
        'SELECT count(*) FROM t_apel_pagi_pengolahan where isSend = 0',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<ApelPagiPengolahanFormModel>> getAllDataNotSend() async {
    return _queryAdapter.queryList(
        'SELECT * FROM t_apel_pagi_pengolahan where isSend = 0',
        mapper: (Map<String, Object?> row) => ApelPagiPengolahanFormModel(
            id: row['id'] as int?,
            rowstamp: row['rowstamp'] as String?,
            tanggal: row['tanggal'] as String?,
            unitKerja: row['unitKerja'] as String?,
            jenisApel: row['jenisApel'] as String?,
            jamMulai: row['jamMulai'] as String?,
            jamSelesai: row['jamSelesai'] as String?,
            latMulai: row['latMulai'] as double?,
            longMulai: row['longMulai'] as double?,
            latSelesai: row['latSelesai'] as double?,
            longSelesai: row['longSelesai'] as double?,
            keterangan: row['keterangan'] as String?,
            createdBy: row['createdBy'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedBy: row['updatedBy'] as String?,
            updatedAt: row['updatedAt'] as String?,
            foto: row['foto'] as String?,
            isSend: row['isSend'] as int?));
  }

  @override
  Future<bool?> deleteDataById(int id) async {
    return _queryAdapter.query(
        'DELETE FROM t_apel_pagi_pengolahan where id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<bool?> deleteDataApelPagiPengolahan() async {
    return _queryAdapter.query('DELETE FROM t_apel_pagi_pengolahan',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<bool?> deleteDataApelPagiPengolahanByDate(String tanggal) async {
    return _queryAdapter.query(
        'DELETE FROM t_apel_pagi_pengolahan WHERE date(tanggal) = ?1 ORDER BY tanggal DESC',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [tanggal]);
  }

  @override
  Future<void> insertDataApelPagiPengolahan(
      ApelPagiPengolahanFormModel data) async {
    await _apelPagiPengolahanFormModelInsertionAdapter.insert(
        data, OnConflictStrategy.rollback);
  }
}
