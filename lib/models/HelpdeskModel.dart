// To parse this JSON data, do
//
//     final produkKonvenModel = produkKonvenModelFromJson(jsonString);

import 'dart:convert';

List<HelpdeskModel> helpdeskModelFromJson(String str) =>
    List<HelpdeskModel>.from(
        json.decode(str).map((x) => HelpdeskModel.fromJson(x)));

String helpdeskModelToJson(List<HelpdeskModel> data) =>
    json.encode(List<dynamic>.from(data.map((HelpdeskModel x) => x.toJson())));

class HelpdeskModel {
  HelpdeskModel(
      {required this.userId,
      required this.levelId,
      this.userAkses,
      this.userAdmin,
      this.userNIP,
      required this.userNama,
      this.userGelar,
      required this.userJabatan,
      this.userTempatlahir,
      this.userTgllahir,
      this.userAlamat,
      this.userKelamin,
      this.userAgama,
      required this.userTelp,
      required this.userEmail,
      this.userPassword,
      this.userUpdatepassword,
      this.userWa,
      this.userFoto,
      this.userStatus,
      this.levelNama});

  String? userId;
  String? levelId;
  dynamic userAkses;
  dynamic userAdmin;
  dynamic userNIP;
  String? userNama;
  dynamic userGelar;
  String? userJabatan;
  dynamic userTempatlahir;
  dynamic userTgllahir;
  dynamic userAlamat;
  dynamic userKelamin;
  dynamic userAgama;
  String? userTelp;
  String? userEmail;
  dynamic userPassword;
  dynamic userUpdatepassword;
  dynamic userWa;
  dynamic userFoto;
  dynamic userStatus;
  dynamic levelNama;

  factory HelpdeskModel.fromJson(Map<String, dynamic> json) => HelpdeskModel(
        userId: json["user_id"],
        levelId: json["level_id"],
        userAkses: json["user_akses"],
        userAdmin: json["user_admin"],
        userNIP: json["user_nip"],
        userNama: json["user_nama"],
        userGelar: json["user_gelar"],
        userJabatan: json["user_jabatan"],
        userTempatlahir: json["user_tempatlahir"],
        userTgllahir: json["user_tgllahir"],
        userAlamat: json["user_alamat"],
        userKelamin: json["user_kelamin"],
        userAgama: json["user_agama"],
        userTelp: json["user_telp"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userUpdatepassword: json["user_updatepassword"],
        userWa: json["user_wa"],
        userFoto: json["user_foto"],
        userStatus: json["user_status"],
        levelNama: json["level_nama"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "level_id": levelId,
        "user_akses": userAkses,
        "user_admin": userAdmin,
        "user_nip": userNIP,
        "user_nama": userNama,
        "user_gelar": userGelar,
        "user_jabatan": userJabatan,
        "user_tempatlahir": userTempatlahir,
        "user_tgllahir": userTgllahir,
        "user_alamat": userAlamat,
        "user_kelamin": userKelamin,
        "user_agama": userAgama,
        "user_telp": userTelp,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_updatepassword": userUpdatepassword,
        "user_wa": userWa,
        "user_foto": userFoto,
        "user_status": userStatus,
        "level_nama": levelNama,
      };
}
