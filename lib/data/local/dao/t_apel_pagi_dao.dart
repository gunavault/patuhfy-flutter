import 'package:floor/floor.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';

@dao
abstract class TApelPagiDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query(
      'SELECT * FROM t_apel_pagi WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<ApelPagiFormModel>> getDataApelPagiByTanggal(String tanggal);

  @Query('SELECT * FROM t_apel_pagi')
  Future<List<ApelPagiFormModel>> getAllApelPagi();

  @Query('SELECT count(*) FROM t_apel_pagi where isSend = 0')
  Future<int?> getCountNotSend();

  @Query('SELECT * FROM t_apel_pagi where isSend = 0')
  Future<List<ApelPagiFormModel>> getAllDataNotSend();

  @Query('DELETE FROM t_apel_pagi where id = :id')
  Future<bool?> deleteDataById(int id);

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_apel_pagi')
  Future<bool?> deleteDataAPelPagi();

  @Query(
      'DELETE FROM t_apel_pagi WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataAPelPagiByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataApelPagi(ApelPagiFormModel data);
}
