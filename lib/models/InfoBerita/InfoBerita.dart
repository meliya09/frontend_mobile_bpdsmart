import 'dart:convert';

List<InfoBerita> beritaFromJson(String str) =>
    // ignore: always_specify_types
    List<InfoBerita>.from(json.decode(str).map((x) => InfoBerita.fromJson(x)));

String beritaToJson(List<InfoBerita> data) =>
    json.encode(List<dynamic>.from(data.map((InfoBerita x) => x.toJson())));

class InfoBerita {
  InfoBerita({
    required this.kontenId,
    required this.kontenGambar,
    this.kontenJudul,
    this.kontenSubjudul,
    this.kontenDeskripsi,
  });

  final String kontenId;
  final String kontenGambar;
  dynamic kontenJudul;
  dynamic kontenSubjudul;
  dynamic kontenDeskripsi;

  factory InfoBerita.fromJson(Map<String, dynamic> json) => InfoBerita(
        kontenId: json["konten_id"] == null ? null : json["konten_id"],
        kontenGambar:
            json["konten_gambar"] == null ? null : json["konten_gambar"],
        kontenJudul: json["konten_judul"],
        kontenSubjudul: json["konten_subjudul"],
        kontenDeskripsi: json["konten_deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "konten_id": kontenId == null ? null : kontenId,
        "konten_gambar": kontenGambar == null ? null : kontenGambar,
        "konten_judul": kontenJudul,
        "konten_subjudul": kontenSubjudul,
        "konten_deskripsi": kontenDeskripsi,
      };
}

// class InfoBerita {
//   InfoBerita({required this.kontenId, required this.kontenGambar});

//   final String kontenId;
//   final String kontenGambar;

//   InfoBerita.fromJson(Map<String, Object?> json)
//       : this(
//             kontenId: json['konten_id']! as String,
//             kontenGambar: json['konten_gambar']! as String);

//   Map<String, Object?> toJson() {
//     return {
//       'konten_id': kontenId,
//       'konten_gambar': kontenGambar,
//     };
//   }
// }

// import 'dart:convert';

// List<InfoBerita> beritaFromJson(String str) =>
//     List<InfoBerita>.from(json.decode(str).map((x) => InfoBerita.fromJson(x)));

// String beritaToJson(List<InfoBerita> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// // List<InfoBerita> storeFromJson(String str) =>
// //     (json.decode(str) as List<dynamic>)
// //         .map((e) => InfoBerita.fromJson(e))
// //         .toList();

// // String infoBeritaToJson(List<InfoBerita> data) =>
// //     json.encode(data.map((e) => e.toJson()).toList());

// class InfoBerita {
//   InfoBerita({
//     required this.kontenId,
//     required this.kontenParent,
//     required this.kontenMenu,
//     required this.kontenJudul,
//     required this.kontenSubjudul,
//     required this.kontenGambar,
//     required this.kontenDeskripsi,
//     this.kontenUrl,
//     required this.filePath,
//   });

//   String kontenId;
//   String kontenParent;
//   String kontenMenu;
//   String kontenJudul;
//   String kontenSubjudul;
//   String kontenGambar;
//   String kontenDeskripsi;
//   dynamic kontenUrl;
//   String filePath;

//   factory InfoBerita.fromJson(Map<String, dynamic> json) => InfoBerita(
//         kontenId: json["konten_id"] ?? null,
//         kontenParent: json["konten_parent"] ?? null,
//         kontenMenu: json["konten_menu"] ?? null,
//         kontenJudul: json["konten_judul"] ?? null,
//         kontenSubjudul: json["konten_subjudul"] ?? null,
//         kontenGambar: json["konten_gambar"] ?? null,
//         kontenDeskripsi: json["konten_deskripsi"] ?? null,
//         kontenUrl: json["konten_url"],
//         filePath: json["file_path"] ?? null,
//       );

//   Map<String, dynamic> toJson() => {
//         "konten_id": kontenId,
//         "konten_parent": kontenParent,
//         "konten_menu": kontenMenu,
//         "konten_judul": kontenJudul,
//         "konten_subjudul": kontenSubjudul,
//         "konten_gambar": kontenGambar,
//         "konten_deskripsi": kontenDeskripsi,
//         "konten_url": kontenUrl,
//         "file_path": filePath,
//       };
// }
