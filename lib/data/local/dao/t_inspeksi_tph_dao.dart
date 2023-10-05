import 'package:floor/floor.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';

@dao
abstract class TInspeksiTphDao {
  // @Query('SELECT * FROM t_inspeksi_Tph WHERE nik_sap = :id')
  // Future<TInspeksiTphEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_inspeksi_tph WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<InspeksiTphFormModel>> getDataInspeksiTphByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_inspeksi_tph')
  Future<List<InspeksiTphFormModel>> getAllInspeksiTph();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_inspeksi_tph')
  Future<bool?> deleteDataInspeksiTph();

  @Query('DELETE FROM t_inspeksi_tph WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataInspeksiTphByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataInspeksiTph(InspeksiTphFormModel data);
}
