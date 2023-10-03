import 'package:floor/floor.dart';
import 'package:patuhfy/models/blok_model.dart';

@dao
abstract class BlokDao {
  @Query('SELECT * FROM m_blok WHERE kodePsa = :psa')
  Future<List<BlokModel>> getBlokByPsa(String psa);

  @Query('SELECT * FROM m_blok WHERE kodePsa = :psa and kodeAfd = :afd')
  Future<List<BlokModel>> getAfdByPsaAndAfd(String psa, String afd);

  @Query(
      'SELECT * FROM m_blok WHERE kodePsa = :psa and kodeAfd = :afd and kodeBlok like %:filter% ')
  Future<List<BlokModel>> getAfdByPsaAndAfdFilter(
      String psa, String afd, String filter);

  @Query('SELECT * FROM m_blok')
  Future<List<BlokModel>> getAllBlok();

  @Query('DELETE FROM m_blok')
  Future<bool?> deleteBlok();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBlok(BlokModel blok);
}
