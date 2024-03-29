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
  String? psa_tipe;
  String? role;
  String? token;
  String? foto;
  int? hasSawit;
  int? hasKaret;
  int? hasTeh;
  int? hasTebu;
  int? hasKopi;

  UserModel(
      {this.id,
      this.nik_sap,
      this.name,
      this.company_code,
      this.company_shortname,
      this.company_longname,
      this.psa,
      this.psa_name,
      this.psa_tipe,
      this.role,
      this.token,
      this.foto,
      this.hasSawit,
      this.hasKaret,
      this.hasTebu,
      this.hasKopi,
      this.hasTeh});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["user"]["nik_sap"]);
    nik_sap = json["user"]["nik_sap"];
    name = json["user"]["nama"];
    company_code = json["user"]["company_code"];
    company_shortname = json["user"]["company"];
    company_longname = json["user"]["company_longname"];
    psa = json["user"]["psa"];
    psa_name = json["user"]["psa_name"];
    psa_tipe = json["user"]["psa_tipe"];
    token = json["user"]["user_tokens"];
    role = json["user"]["role"];
    foto = json["user"]["photo"];
    hasSawit = json["user"]["has_sawit"];
    hasKaret = json["user"]["has_karet"];
    hasTebu = json["user"]["has_tebu"];
    hasKopi = json["user"]["has_kopi"];
    hasTeh = json["user"]["has_teh"];
  }
}

class UserModelResponse {
  UserModel? userModel;
  String? message;

  UserModelResponse({this.userModel, this.message});
}
