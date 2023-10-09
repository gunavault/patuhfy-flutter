import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';

@dao
abstract class TRealPengendalianHamaDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_real_pengendalian_hama WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealPengendalianHamaFormModel>> getDataRealPengendalianHamaByTanggal(String tanggal);

  @Query('SELECT * FROM t_real_pengendalian_hama')
  Future<List<RealPengendalianHamaFormModel>> getAllRealPengendalianHama();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_real_pengendalian_hama')
  Future<bool?> deleteDataRealPengendalianHama();

  @Query('DELETE FROM t_real_pengendalian_hama WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealPengendalianHamaByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealPengendalianHama(RealPengendalianHamaFormModel data);
}
