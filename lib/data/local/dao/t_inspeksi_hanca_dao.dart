import 'package:floor/floor.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';

@dao
abstract class TInspeksiHancaDao {
  // @Query('SELECT * FROM t_inspeksi_hanca WHERE nik_sap = :id')
  // Future<TInspeksiHancaEntity?> getAfdById(int id);

  @Query(
      'SELECT * FROM t_inspeksi_hanca WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<InspeksiHancaFormModel>> getDataInspeksiHancaByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_inspeksi_hanca')
  Future<List<InspeksiHancaFormModel>> getAllInspeksiHanca();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);
  @Query('SELECT count(*) FROM t_inspeksi_hanca where isSend = 0')
  Future<int?> getCountNotSend();

  @Query('DELETE FROM t_inspeksi_hanca where id = :id')
  Future<bool?> deleteDataById(int id);

  @Query('SELECT * FROM t_inspeksi_hanca where isSend = 0')
  Future<List<InspeksiHancaFormModel>> getAllDataNotSend();

  @Query('DELETE FROM t_inspeksi_hanca')
  Future<bool?> deleteDataInspeksiHanca();

  @Query(
      'DELETE FROM t_inspeksi_hanca WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataInspeksiHancaByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataInspeksiHanca(InspeksiHancaFormModel data);
}
