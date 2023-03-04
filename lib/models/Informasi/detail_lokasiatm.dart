// To parse this JSON data, do
//
//     final danaKonven = danaKonvenFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

List<DetailLokasiATM> detailLokasiATMFromJson(String str) =>
    List<DetailLokasiATM>.from(
        json.decode(str).map((x) => DetailLokasiATM.fromJson(x)));

String detailLokasiATMToJson(List<DetailLokasiATM> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailLokasiATM {
  DetailLokasiATM({
    this.lokasiId,
    this.kontenId,
    this.lokasiLevel,
    this.lokasiParent,
    this.kategoriId,
    this.lokasiGambar,
    this.lokasiNama,
    this.lokasiAlamat,
    this.lokasiTelp,
    this.lokasiFax,
    this.lokasiLat,
    this.lokasiLon,
    this.filePath,
  });

  String? lokasiId;
  String? kontenId;
  String? lokasiLevel;
  String? lokasiParent;
  String? kategoriId;
  dynamic lokasiGambar;
  String? lokasiNama;
  String? lokasiAlamat;
  String? lokasiTelp;
  String? lokasiFax;
  String? lokasiLat;
  String? lokasiLon;
  dynamic filePath;

  factory DetailLokasiATM.fromJson(Map<String, dynamic> json) =>
      DetailLokasiATM(
        lokasiId: json["lokasi_id"] ?? null,
        kontenId: json["konten_id"] ?? null,
        lokasiLevel: json["lokasi_level"] ?? null,
        lokasiParent: json["lokasi_parent"] ?? null,
        kategoriId: json["kategori_id"] ?? null,
        lokasiGambar: json["lokasi_gambar"] ?? null,
        lokasiNama: json["lokasi_nama"] ?? null,
        lokasiAlamat: json["lokasi_alamat"] ?? null,
        lokasiTelp: json["lokasi_telp"] ?? null,
        lokasiFax: json["lokasi_fax"] ?? null,
        lokasiLat: json["lokasi_lat"] ?? null,
        lokasiLon: json["lokasi_lon"] ?? null,
        filePath: json["file_path"],
      );

  Map<String, dynamic> toJson() => {
        "lokasi_id": lokasiId ?? null,
        "konten_id": kontenId ?? null,
        "lokasi_level": lokasiLevel ?? null,
        "lokasi_parent": lokasiParent ?? null,
        "kategori_id": kategoriId ?? null,
        "lokasi_gambar": lokasiGambar ?? null,
        "lokasi_nama": lokasiNama ?? null,
        "lokasi_alamat": lokasiAlamat ?? null,
        "lokasi_telp": lokasiTelp ?? null,
        "lokasi_fax": lokasiFax ?? null,
        "lokasi_lat": lokasiLat ?? null,
        "lokasi_lon": lokasiLon ?? null,
        "file_path": filePath,
      };
}
