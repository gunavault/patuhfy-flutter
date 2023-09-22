import 'package:floor/floor.dart';
import 'package:patuhfy/models/afdeling_model.dart';

@dao
abstract class AfdelingDao {
  // @Query('SELECT * FROM m_afdeling WHERE nik_sap = :id')
  // Future<AfdelingModel?> getAfdById(int id);

  @Query('SELECT * FROM m_afdeling WHERE nik_sap = :psa')
  Future<AfdelingModel?> getAfdByPSA(String psa);

  @Query('SELECT * FROM m_afdeling')
  Future<List<AfdelingModel>> getAllAfd();

  // @update
  // @Query('UPDATE user set foto = :foto WHERE username = :username')
  // Future<UserModel?> updateFoto(String username, String foto);

  @Query('DELETE FROM m_afdeling')
  Future<bool?> deleteAfd();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAfdeling(AfdelingModel afd);
}
