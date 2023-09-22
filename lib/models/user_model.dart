import 'package:floor/floor.dart';

@Entity(tableName: "user")
class UserModel {
  @primaryKey
  int? id;
  String? nik_sap;
  String? name;
  String? company_code;
  String? company_shortname;
  String? company_longname;
  String? psa;
  String? psa_name;
  String? role;
  String? token;
  String? foto;

  UserModel(
      {this.id,
      this.nik_sap,
      this.name,
      this.company_code,
      this.company_shortname,
      this.company_longname,
      this.psa,
      this.psa_name,
      this.role,
      this.token,
      this.foto});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["user"]["nik_sap"]);
    nik_sap = json["user"]["nik_sap"];
    name = json["user"]["nama"];
    company_code = json["user"]["company_code"];
    company_shortname = json["user"]["company"];
    company_longname = json["user"]["company_longname"];
    psa = json["user"]["psa"];
    psa_name = json["user"]["psa_name"];
    token = json["user"]["user_tokens"];
    role = json["user"]["role"];
    foto = json["user"]["photo"];
  }
}

class UserModelResponse {
  UserModel? userModel;
  String? message;

  UserModelResponse({this.userModel, this.message});
}
