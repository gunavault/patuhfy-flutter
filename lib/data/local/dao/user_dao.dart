import 'package:floor/floor.dart';
import 'package:patuhfy/models/user_model.dart';

@dao
abstract class UserDao {
  // @Query('SELECT * FROM user WHERE nik_sap = :id')
  // Future<UserModel?> getUserById(int id);

  @Query('SELECT * FROM user WHERE nik_sap = :nikSap')
  Future<UserModel?> getUserByNikSAP(String nikSap);

  @Query('DELETE FROM user WHERE nik_sap=:nikSap')
  Future<bool?> deleteUserByNikSAP(String nikSap);

  @Query('DELETE FROM user')
  Future<bool?> deleteUser();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(UserModel user);
}
