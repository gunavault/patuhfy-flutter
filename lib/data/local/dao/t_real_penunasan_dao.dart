import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_penunasan_form_model.dart';

@dao
abstract class TRealPenunasanDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_real_penunasan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealPenunasanFormModel>> getDataRealPenunasanByTanggal(String tanggal);

  @Query('SELECT * FROM t_real_penunasan')
  Future<List<RealPenunasanFormModel>> getAllRealPenunasan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_real_penunasan')
  Future<bool?> deleteDataRealPenunasan();

  @Query('DELETE FROM t_real_penunasan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealPenunasanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealPenunasan(RealPenunasanFormModel data);
}
