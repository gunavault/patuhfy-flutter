import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_penyiangan_form_model.dart';

@dao
abstract class TRealPenyianganDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_real_penyiangan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealPenyianganFormModel>> getDataRealPenyianganByTanggal(String tanggal);

  @Query('SELECT * FROM t_real_penyiangan')
  Future<List<RealPenyianganFormModel>> getAllRealPenyiangan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_real_penyiangan')
  Future<bool?> deleteDataRealPenyiangan();

  @Query('DELETE FROM t_real_penyiangan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealPenyianganByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealPenyiangan(RealPenyianganFormModel data);
}
