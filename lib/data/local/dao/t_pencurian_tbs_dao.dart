import 'package:floor/floor.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';

@dao
abstract class TPencurianTbsDao {
  // @Query('SELECT * FROM t_pencurian_tbs WHERE nik_sap = :id')
  // Future<TPencurianTbsEntity?> getAfdById(int id);

  @Query('SELECT * FROM t_pencurian_tbs WHERE tanggal = :tanggal')
  Future<List<PencurianTbsFormModel>> getDataPencurianTbsByTanggal(
      String tanggal);

  @Query('SELECT * FROM t_pencurian_tbs')
  Future<List<PencurianTbsFormModel>> getAllPencurianTbs();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM t_pencurian_tbs')
  Future<bool?> deleteDataPencurianTbs();

  @Query('DELETE FROM t_pencurian_tbs where tanggal = :tanggal')
  Future<bool?> deleteDataPencurianTbsByDate(String tanggal);

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertDataPencurianTbs(PencurianTbsFormModel data);
}
