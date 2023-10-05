import 'package:floor/floor.dart';

import 'package:patuhfy/models/real_rencana_pengangkutan_form_model.dart';

@dao
abstract class TRealRencanaPengangkutan {
  // @Query('SELECT * FROM t_apel_pagi WHERE nik_sap = :id')
  // Future<TApelPagiEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_real_rencana_pengangkutan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<RealRencanapengangkutanFormModel>> getDataRealRencanaPengangkutanByTanggal(String tanggal);

  @Query('SELECT * FROM t_real_rencana_pengangkutan')
  Future<List<RealRencanapengangkutanFormModel>> getAllRealRencanaPengangkutan();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_real_rencana_pengangkutan')
  Future<bool?> deleteDataRealRencanaPengangkutan();

  @Query('DELETE FROM t_real_rencana_pengangkutan WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<bool?> deleteDataRealRencanaPengangkutanByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataRealRencanaPengangkutan(RealRencanapengangkutanFormModel data);
}
