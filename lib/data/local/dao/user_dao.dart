import 'package:floor/floor.dart';
import 'package:patuhfy/models/entities/user_model_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user WHERE nik_sap = :id')
  Future<UserModel?> getUserById(int id);

  @Query('SELECT * FROM user WHERE nik_sap = :nik_sap')
  Future<UserModel?> getUserByNikSAP(String nik_sap);

  @Query('DELETE FROM user WHERE nik_sap=:nik_sap')
  Future<bool?> deleteUserByNikSAP(String nik_sap);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(UserModel user);
}
