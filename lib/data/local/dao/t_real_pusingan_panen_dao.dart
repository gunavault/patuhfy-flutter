import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';

@dao
abstract class TRealPusinganPanenDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query(
      'SELECT * FROM t_real_pusingan_panen WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealPusinganPanenFormModel>> getDataRealPusinganPanenByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_real_pusingan_panen')
  Future<List<RealPusinganPanenFormModel>> getAllRealPusinganPanen();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);
  @Query('SELECT count(*) FROM t_real_pusingan_panen where isSend = 0')
  Future<int?> getCountNotSend();

  @Query('SELECT * FROM t_real_pusingan_panen where isSend = 0')
  Future<List<RealPusinganPanenFormModel>> getAllDataNotSend();

  @Query('DELETE FROM t_real_pusingan_panen where id = :id')
  Future<bool?> deleteDataById(int id);

  @Query('DELETE FROM t_real_pusingan_panen')
  Future<bool?> deleteDataRealPusinganPanen();

  @Query(
      'DELETE FROM t_real_pusingan_panen WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealPusinganPanenByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealPusinganPanen(RealPusinganPanenFormModel data);
}
