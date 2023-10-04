import 'package:floor/floor.dart';
import 'package:patuhfy/models/pemanen_model.dart';

@dao
abstract class PemanenDao {
  @Query('SELECT * FROM m_pemanen WHERE kodePsa = :psa')
  Future<List<PemanenModel>> getPemanenByPsa(String psa);

  @Query('SELECT * FROM m_pemanen WHERE nikSapMandor = :nikMandor')
  Future<List<PemanenModel>> getPemanenByMandor(String nikMandor);

  @Query('SELECT * FROM m_pemanen WHERE kodePsa = :psa and kodeAfd = :afd')
  Future<List<PemanenModel>> getAfdByPsaAndAfd(String psa, String afd);

  @Query('SELECT * FROM m_pemanen')
  Future<List<PemanenModel>> getAllPemanen();

  @Query('DELETE FROM m_pemanen')
  Future<bool?> deletePemanen();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPemanen(PemanenModel pemanen);
}
