import 'package:floor/floor.dart';
import 'package:patuhfy/models/mandor_model.dart';

@dao
abstract class MandorDao {
  @Query('SELECT * FROM m_mandor WHERE kodePsa = :psa')
  Future<List<MandorModel>> getMandorByPsa(String psa);

  @Query('SELECT * FROM m_mandor WHERE kodePsa = :psa and kodeAfd = :afd')
  Future<List<MandorModel>> getAfdByPsaAndAfd(String psa, String afd);

  @Query('SELECT * FROM m_mandor')
  Future<List<MandorModel>> getAllMandor();

  @Query('DELETE FROM m_mandor')
  Future<bool?> deleteMandor();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMandor(MandorModel mandor);
}
