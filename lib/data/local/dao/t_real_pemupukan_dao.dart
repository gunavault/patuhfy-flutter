import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_pemupukan_form_model.dart';

@dao
abstract class TRealPemupukanDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query(
      'SELECT * FROM t_real_pemupukan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealPemupukanFormModel>> getDataRealPemupukanByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_real_pemupukan')
  Future<List<RealPemupukanFormModel>> getAllRealPemupukan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);
  @Query('SELECT count(*) FROM t_real_pemupukan where isSend = 0')
  Future<int?> getCountNotSend();

  @Query('SELECT * FROM t_real_pemupukan where isSend = 0')
  Future<List<RealPemupukanFormModel>> getAllDataNotSend();

  @Query('DELETE FROM t_real_pemupukan where id = :id')
  Future<bool?> deleteDataById(int id);

  @Query('DELETE FROM t_real_pemupukan')
  Future<bool?> deleteDataRealPemupukan();

  @Query(
      'DELETE FROM t_real_pemupukan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealPemupukanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealPemupukan(RealPemupukanFormModel data);
}
