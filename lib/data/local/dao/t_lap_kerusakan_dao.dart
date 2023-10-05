import 'package:floor/floor.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';

@dao
abstract class TLapKerusakanDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_lap_kerusakan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<LapKerusakanFormModel>> getDataLapKerusakanByTanggal(String tanggal);

  @Query('SELECT * FROM t_lap_kerusakan')
  Future<List<LapKerusakanFormModel>> getAllLapKerusakan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_lap_kerusakan')
  Future<bool?> deleteDataLapKerusakan();

  @Query('DELETE FROM t_lap_kerusakan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataLapKerusakanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataLapKerusakan(LapKerusakanFormModel data);
}
