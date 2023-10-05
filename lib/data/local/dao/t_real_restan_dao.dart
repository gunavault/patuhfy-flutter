import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_restan_form_model.dart';

@dao
abstract class TRealRestan {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_real_restan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealRestanFormModel>> getDataRealRestanByTanggal(String tanggal);

  @Query('SELECT * FROM t_real_restan')
  Future<List<RealRestanFormModel>> getAllRealRestan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_real_restan')
  Future<bool?> deleteDataRealRestan();

  @Query('DELETE FROM t_real_restan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealRestanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealRestan(RealRestanFormModel data);
}
