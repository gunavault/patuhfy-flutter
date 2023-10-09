import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';

@dao
abstract class TRealPemeliharaanJalanDao {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_real_pemeliharaan_jalan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealPemeliharaanJalanFormModel>> getDataRealPemeliharaanJalanByTanggal(String tanggal);

  @Query('SELECT * FROM t_real_pemeliharaan_jalan')
  Future<List<RealPemeliharaanJalanFormModel>> getAllRealPemeliharaanJalan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_real_pemeliharaan_jalan')
  Future<bool?> deleteDataRealPemeliharaanJalan();

  @Query('DELETE FROM t_real_pemeliharaan_jalan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealPemeliharaanJalanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealPemeliharaanJalan(RealPemeliharaanJalanFormModel data);
}
