// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    required this.status,
    required this.error,
    required this.message,
    required this.totaldata,
    required this.data,
  });

  int status;
  String error;
  String message;
  int totaldata;
  List<SearchMenu> data;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        totaldata: json["totaldata"],
        data: List<SearchMenu>.from(
            json["data"].map((x) => SearchMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "totaldata": totaldata,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SearchMenu {
  SearchMenu({
    required this.kontenId,
    required this.kontenParent,
    this.kontenUrut,
    required this.kategoriId,
    this.kontenSimulasi,
    this.kontenSukuBunga,
    required this.kontenMenu,
    this.kontenJudul,
    this.kontenSubjudul,
    this.kontenGambar,
    this.kontenGambar2,
    this.kontenGambar3,
    this.kontenDeskripsi,
    this.kontenSyarat,
    this.kontenKetentuan,
    this.kontenFasilitas,
    this.kontenPromosiGambar,
    this.kontenPromosiText,
    this.kontenSk,
    this.kontenStatus,
    this.kontenUpdate,
    this.kontenApproval,
    required this.kontenUrl,
    this.filePath,
    this.kontenDeskripsi2,
    this.kontenDeskripsi3,
    this.filePath2,
    this.filePath3,
    this.kategoriNama,
  });

  String kontenId;
  String kontenParent;
  dynamic kontenUrut;
  String kategoriId;
  dynamic kontenSimulasi;
  dynamic kontenSukuBunga;
  String kontenMenu;
  String? kontenJudul;
  dynamic kontenSubjudul;
  dynamic kontenGambar;
  dynamic kontenGambar2;
  dynamic kontenGambar3;
  dynamic kontenDeskripsi;
  dynamic kontenSyarat;
  dynamic kontenKetentuan;
  dynamic kontenFasilitas;
  dynamic kontenPromosiGambar;
  dynamic kontenPromosiText;
  dynamic kontenSk;
  dynamic kontenStatus;
  dynamic kontenUpdate;
  dynamic kontenApproval;
  String? kontenUrl;
  dynamic filePath;
  dynamic kontenDeskripsi2;
  dynamic kontenDeskripsi3;
  dynamic filePath2;
  dynamic filePath3;
  String? kategoriNama;

  factory SearchMenu.fromJson(Map<String, dynamic> json) => SearchMenu(
        kontenId: json["konten_id"],
        kontenParent: json["konten_parent"],
        kontenUrut: json["konten_urut"],
        kategoriId: json["kategori_id"],
        kontenSimulasi: json["konten_simulasi"],
        kontenSukuBunga: json["konten_suku_bunga"],
        kontenMenu: json["konten_menu"],
        kontenJudul: json["konten_judul"],
        kontenSubjudul: json["konten_subjudul"],
        kontenGambar: json["konten_gambar"],
        kontenGambar2: json["konten_gambar2"],
        kontenGambar3: json["konten_gambar3"],
        kontenDeskripsi: json["konten_deskripsi"],
        kontenSyarat: json["konten_syarat"],
        kontenKetentuan: json["konten_ketentuan"],
        kontenFasilitas: json["konten_fasilitas"],
        kontenPromosiGambar: json["konten_promosi_gambar"],
        kontenPromosiText: json["konten_promosi_text"],
        kontenSk: json["konten_sk"],
        kontenStatus: json["konten_status"],
        kontenUpdate: json["konten_update"],
        kontenApproval: json["konten_approval"],
        kontenUrl: json["konten_url"],
        filePath: json["file_path"],
        kontenDeskripsi2: json["konten_deskripsi2"],
        kontenDeskripsi3: json["konten_deskripsi3"],
        filePath2: json["file_path2"],
        filePath3: json["file_path3"],
        kategoriNama: json["kategori_nama"],
      );

  Map<String, dynamic> toJson() => {
        "konten_id": kontenId,
        "konten_parent": kontenParent,
        "konten_urut": kontenUrut,
        "kategori_id": kategoriId,
        "konten_simulasi": kontenSimulasi,
        "konten_suku_bunga": kontenSukuBunga,
        "konten_menu": kontenMenu,
        "konten_judul": kontenJudul,
        "konten_subjudul": kontenSubjudul,
        "konten_gambar": kontenGambar,
        "konten_gambar2": kontenGambar2,
        "konten_gambar3": kontenGambar3,
        "konten_deskripsi": kontenDeskripsi,
        "konten_syarat": kontenSyarat,
        "konten_ketentuan": kontenKetentuan,
        "konten_fasilitas": kontenFasilitas,
        "konten_promosi_gambar": kontenPromosiGambar,
        "konten_promosi_text": kontenPromosiText,
        "konten_sk": kontenSk,
        "konten_status": kontenStatus,
        "konten_update": kontenUpdate,
        "konten_approval": kontenApproval,
        "konten_url": kontenUrl,
        "file_path": filePath,
        "konten_deskripsi2": kontenDeskripsi2,
        "konten_deskripsi3": kontenDeskripsi3,
        "file_path2": filePath2,
        "file_path3": filePath3,
        "kategori_nama": kategoriNama,
      };
}
