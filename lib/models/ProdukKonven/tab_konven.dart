import 'dart:convert';

List<TabKonven> tabKonvenFromJson(String str) =>
    List<TabKonven>.from(json.decode(str).map((x) => TabKonven.fromJson(x)));

String tabKonvenToJson(List<TabKonven> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TabKonven {
  TabKonven({
    this.kontenId,
    this.kontenParent,
    this.kontenUrut,
    this.kategoriId,
    this.kontenSimulasi,
    this.kontenSukuBunga,
    this.kontenMenu,
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
    this.kontenUrl,
    this.filePath,
    this.kategoriNama,
  });

  String? kontenId;
  String? kontenParent;
  dynamic kontenUrut;
  String? kategoriId;
  String? kontenSimulasi;
  dynamic kontenSukuBunga;
  String? kontenMenu;
  dynamic kontenJudul;
  String? kontenSubjudul;
  String? kontenGambar;
  dynamic kontenGambar2;
  dynamic kontenGambar3;
  String? kontenDeskripsi;
  String? kontenSyarat;
  String? kontenKetentuan;
  String? kontenFasilitas;
  String? kontenPromosiGambar;
  String? kontenPromosiText;
  String? kontenSk;
  dynamic kontenStatus;
  dynamic kontenUpdate;
  dynamic kontenApproval;
  dynamic kontenUrl;
  String? filePath;
  String? kategoriNama;

  factory TabKonven.fromJson(Map<String, dynamic> json) => TabKonven(
        kontenId: json["konten_id"] ?? null,
        kontenParent: json["konten_parent"],
        kontenUrut: json["konten_urut"],
        kategoriId: json["kategori_id"] ?? null,
        kontenSimulasi: json["konten_simulasi"] ?? null,
        kontenSukuBunga: json["konten_suku_bunga"],
        kontenMenu: json["konten_menu"] ?? null,
        kontenJudul: json["konten_judul"],
        kontenSubjudul: json["konten_subjudul"] ?? null,
        kontenGambar: json["konten_gambar"] ?? null,
        kontenGambar2: json["konten_gambar2"],
        kontenGambar3: json["konten_gambar3"],
        kontenDeskripsi: json["konten_deskripsi"] ?? null,
        kontenSyarat: json["konten_syarat"] ?? null,
        kontenKetentuan: json["konten_ketentuan"] ?? null,
        kontenFasilitas: json["konten_fasilitas"] ?? null,
        kontenPromosiGambar: json["konten_promosi_gambar"] ?? null,
        kontenPromosiText: json["konten_promosi_text"] ?? null,
        kontenSk: json["konten_sk"] ?? null,
        kontenStatus: json["konten_status"],
        kontenUpdate: json["konten_update"],
        kontenApproval: json["konten_approval"],
        kontenUrl: json["konten_url"],
        filePath: json["file_path"] ?? null,
        kategoriNama: json["kategori_nama"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "konten_id": kontenId ?? null,
        "konten_parent": kontenParent,
        "konten_urut": kontenUrut,
        "kategori_id": kategoriId ?? null,
        "konten_simulasi": kontenSimulasi ?? null,
        "konten_suku_bunga": kontenSukuBunga,
        "konten_menu": kontenMenu ?? null,
        "konten_judul": kontenJudul,
        "konten_subjudul": kontenSubjudul ?? null,
        "konten_gambar": kontenGambar ?? null,
        "konten_gambar2": kontenGambar2,
        "konten_gambar3": kontenGambar3,
        "konten_deskripsi": kontenDeskripsi ?? null,
        "konten_syarat": kontenSyarat ?? null,
        "konten_ketentuan": kontenKetentuan ?? null,
        "konten_fasilitas": kontenFasilitas ?? null,
        "konten_promosi_gambar": kontenPromosiGambar ?? null,
        "konten_promosi_text": kontenPromosiText ?? null,
        "konten_sk": kontenSk ?? null,
        "konten_status": kontenStatus,
        "konten_update": kontenUpdate,
        "konten_approval": kontenApproval,
        "konten_url": kontenUrl,
        "file_path": filePath ?? null,
        "kategori_nama": kategoriNama ?? null,
      };
}

// List<TabKonven> tabKonvenFromJson(String str) =>
//     // ignore: always_specify_types
//     List<TabKonven>.from(json.decode(str).map((x) => TabKonven.fromJson(x)));

// String tabKonvenToJson(List<TabKonven> data) =>
//     json.encode(List<dynamic>.from(data.map((TabKonven x) => x.toJson())));

// class TabKonven {
//   TabKonven({
//     this.kontenId,
//     this.kontenParent,
//     this.kontenUrut,
//     this.kategoriId,
//     this.kontenSimulasi,
//     this.kontenSukuBunga,
//     this.kontenMenu,
//     this.kontenJudul,
//     this.kontenSubjudul,
//     this.kontenGambar,
//     this.kontenGambar2,
//     this.kontenGambar3,
//     this.kontenDeskripsi,
//     this.kontenSyarat,
//     this.kontenKetentuan,
//     this.kontenFasilitas,
//     this.kontenPromosiGambar,
//     this.kontenPromosiText,
//     this.kontenSk,
//     this.kontenStatus,
//     this.kontenUpdate,
//     this.kontenApproval,
//     this.kontenUrl,
//     this.filePath,
//     this.kategoriNama,
//   });

//   String? kontenId;
//   String? kontenParent;
//   dynamic kontenUrut;
//   String? kategoriId;
//   String? kontenSimulasi;
//   dynamic kontenSukuBunga;
//   String? kontenMenu;
//   String? kontenJudul;
//   String? kontenSubjudul;
//   String? kontenGambar;
//   dynamic kontenGambar2;
//   dynamic kontenGambar3;
//   String? kontenDeskripsi;
//   String? kontenSyarat;
//   String? kontenKetentuan;
//   String? kontenFasilitas;
//   String? kontenPromosiGambar;
//   String? kontenPromosiText;
//   String? kontenSk;
//   dynamic kontenStatus;
//   dynamic kontenUpdate;
//   dynamic kontenApproval;
//   dynamic kontenUrl;
//   String? filePath;
//   String? kategoriNama;

//   factory TabKonven.fromJson(Map<String, dynamic> json) => TabKonven(
//         kontenId: json["konten_id"] == null ? null : json["konten_id"],
//         kontenParent:
//             json["konten_parent"] == null ? null : json["konten_parent"],
//         kontenUrut: json["konten_urut"],
//         kategoriId: json["kategori_id"] == null ? null : json["kategori_id"],
//         kontenSimulasi:
//             json["konten_simulasi"] == null ? null : json["konten_simulasi"],
//         kontenSukuBunga: json["konten_suku_bunga"],
//         kontenMenu: json["konten_menu"] == null ? null : json["konten_menu"],
//         kontenJudul: json["konten_judul"] == null ? null : json["konten_judul"],
//         kontenGambar:
//             json["konten_gambar"] == null ? null : json["konten_gambar"],
//         kontenGambar2: json["konten_gambar2"],
//         kontenGambar3: json["konten_gambar3"],
//         kontenDeskripsi:
//             json["konten_deskripsi"] == null ? null : json["konten_deskripsi"],
//         kontenSyarat:
//             json["konten_syarat"] == null ? null : json["konten_syarat"],
//         kontenKetentuan:
//             json["konten_ketentuan"] == null ? null : json["konten_ketentuan"],
//         kontenFasilitas:
//             json["konten_fasilitas"] == null ? null : json["konten_fasilitas"],
//         kontenPromosiGambar: json["konten_promosi_gambar"] == null
//             ? null
//             : json["konten_promosi_gambar"],
//         kontenPromosiText: json["konten_promosi_text"] == null
//             ? null
//             : json["konten_promosi_text"],
//         kontenSk: json["konten_sk"] == null ? null : json["konten_sk"],
//         kontenStatus: json["konten_status"],
//         kontenUpdate: json["konten_update"],
//         kontenApproval: json["konten_approval"],
//         kontenUrl: json["konten_url"],
//         filePath: json["filepath"] == null ? null : json["filepath"],
//         kategoriNama:
//             json["kategori_nama"] == null ? null : json["kategori_nama"],
//       );

//   Map<String, dynamic> toJson() => {
//         "konten_id": kontenId == null ? null : kontenId,
//         "konten_parent": kontenParent == null ? null : kontenParent,
//         "konten_urut": kontenUrut,
//         "kategori_id": kategoriId == null ? null : kategoriId,
//         "konten_simulasi": kontenSimulasi == null ? null : kontenSimulasi,
//         "konten_suku_bunga": kontenSukuBunga,
//         "konten_menu": kontenMenu == null ? null : kontenMenu,
//         "konten_judul": kontenJudul == null ? null : kontenJudul,
//         "konten_subjudul": kontenSubjudul == null ? null : kontenSubjudul,
//         "konten_gambar": kontenGambar == null ? null : kontenGambar,
//         "konten_gambar2": kontenGambar2,
//         "konten_gambar3": kontenGambar3,
//         "konten_deskripsi": kontenDeskripsi == null ? null : kontenDeskripsi,
//         "konten_syarat": kontenSyarat == null ? null : kontenSyarat,
//         "konten_ketentuan": kontenKetentuan == null ? null : kontenKetentuan,
//         "konten_fasilitas": kontenFasilitas == null ? null : kontenFasilitas,
//         "konten_promosi_gambar":
//             kontenPromosiGambar == null ? null : kontenPromosiGambar,
//         "konten_promosi_text":
//             kontenPromosiText == null ? null : kontenPromosiText,
//         "konten_sk": kontenSk == null ? null : kontenSk,
//         "konten_status": kontenStatus,
//         "konten_update": kontenUpdate,
//         "konten_approval": kontenApproval,
//         "konten_url": kontenUrl,
//         "filepath": filePath == null ? null : filePath,
//         "kategori_nama": kategoriNama == null ? null : kategoriNama,
//       };
// }
