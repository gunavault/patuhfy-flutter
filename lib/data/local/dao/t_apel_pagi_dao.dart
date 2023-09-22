import 'package:floor/floor.dart';
import 'package:patuhfy/models/entities/t_apel_pagi_model_entity.dart';

@dao
abstract class TApelPagiDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :tanggal')
  Future<TApelPagiEntity?> getDataApelPagiByTanggal(String tanggal);

  @Query('SELECT * FROM t_apel_pagi')
  Future<List<TApelPagiEntity>> getAllApelPagi();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_apel_pagi')
  Future<bool?> deleteDataAPelPagi();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertDataApelPagi(TApelPagiEntity data);
}
