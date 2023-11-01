import 'package:floor/floor.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';

@dao
abstract class TApelPagiPengolahanDao {
  // @Query('SELECT * FROM t_apel_pagi_pengolahan WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query(
      'SELECT * FROM t_apel_pagi_pengolahan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<ApelPagiPengolahanFormModel>> getDataApelPagiPengolahanByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_apel_pagi_pengolahan')
  Future<List<ApelPagiPengolahanFormModel>> getAllApelPagiPengolahan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('SELECT count(*) FROM t_apel_pagi_pengolahan where isSend = 0')
  Future<int?> getCountNotSend();

  @Query('SELECT * FROM t_apel_pagi_pengolahan where isSend = 0')
  Future<List<ApelPagiPengolahanFormModel>> getAllDataNotSend();

  @Query('DELETE FROM t_apel_pagi_pengolahan where id = :id')
  Future<bool?> deleteDataById(int id);

  @Query('DELETE FROM t_apel_pagi_pengolahan')
  Future<bool?> deleteDataApelPagiPengolahan();

  @Query(
      'DELETE FROM t_apel_pagi_pengolahan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataApelPagiPengolahanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataApelPagiPengolahan(ApelPagiPengolahanFormModel data);
}
