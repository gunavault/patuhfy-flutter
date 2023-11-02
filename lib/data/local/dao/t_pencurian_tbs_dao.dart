import 'package:floor/floor.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';

@dao
abstract class TPencurianTbsDao {
  // @Query('SELECT * FROM t_pencurian_tbs WHERE nik_sap = :id')
  // Future<TPencurianTbsEntity?> getAfdById(int id);

  @Query(
      'SELECT * FROM t_pencurian_tbs WHERE date(tanggal) = :tanggal ORDER BY tanggal DESC')
  Future<List<PencurianTbsFormModel>> getDataPencurianTbsByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_pencurian_tbs')
  Future<List<PencurianTbsFormModel>> getAllPencurianTbs();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);
  @Query('SELECT count(*) FROM t_pencurian_tbs where isSend = 0')
  Future<int?> getCountNotSend();

  @Query('SELECT * FROM t_pencurian_tbs where isSend = 0')
  Future<List<PencurianTbsFormModel>> getAllDataNotSend();

  @Query('DELETE FROM t_pencurian_tbs where id = :id')
  Future<bool?> deleteDataById(int id);

  @Query('DELETE FROM t_pencurian_tbs where isSend = 1')
  Future<bool?> deleteDataWhichHasSend();

  @Query('DELETE FROM t_pencurian_tbs')
  Future<bool?> deleteDataPencurianTbs();

  @Query('DELETE FROM t_pencurian_tbs WHERE date(tanggal) = :tanggal')
  Future<bool?> deleteDataPencurianTbsByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataPencurianTbs(PencurianTbsFormModel data);
}
