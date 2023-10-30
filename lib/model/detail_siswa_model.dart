// // To parse this JSON data, do
// //
// //     final detailSiswaModel = detailSiswaModelFromJson(jsonString);

// import 'dart:convert';

// DetailSiswaModel detailSiswaModelFromJson(Map<String, dynamic> str) => DetailSiswaModel.fromJson((str));

// String detailSiswaModelToJson(DetailSiswaModel data) => json.encode(data.toJson());

// class DetailSiswaModel {
//     Data data;
//     Meta meta;

//     DetailSiswaModel({
//         required this.data,
//         required this.meta,
//     });

//     factory DetailSiswaModel.fromJson(Map<String, dynamic> json) => DetailSiswaModel(
//         data: Data.fromJson(json["data"]),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//         "meta": meta.toJson(),
//     };
// }

// class Data {
//     int id;
//     Attributes attributes;

//     Data({
//         required this.id,
//         required this.attributes,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         attributes: Attributes.fromJson(json["attributes"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//     };
// }

// class Attributes {
//     String namaSiswa;
//     DateTime createdAt;
//     DateTime updatedAt;
//     DateTime publishedAt;
//     int ulanganHarian1;
//     int ulanganHarian2;
//     int ulanganHarian3;
//     String fotoProfile;
//     int uts;
//     int uas;
//     String nis;

//     Attributes({
//         required this.namaSiswa,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.publishedAt,
//         required this.ulanganHarian1,
//         required this.ulanganHarian2,
//         required this.ulanganHarian3,
//         required this.fotoProfile,
//         required this.uts,
//         required this.uas,
//         required this.nis,
//     });

//     factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
//         namaSiswa: json["nama_siswa"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         ulanganHarian1: json["ulangan_harian_1"],
//         ulanganHarian2: json["ulangan_harian_2"],
//         ulanganHarian3: json["ulangan_harian_3"],
//         fotoProfile: json["foto_profile"],
//         uts: json["uts"],
//         uas: json["uas"],
//         nis: json["nis"],
//     );

//     Map<String, dynamic> toJson() => {
//         "nama_siswa": namaSiswa,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "publishedAt": publishedAt.toIso8601String(),
//         "ulangan_harian_1": ulanganHarian1,
//         "ulangan_harian_2": ulanganHarian2,
//         "ulangan_harian_3": ulanganHarian3,
//         "foto_profile": fotoProfile,
//         "uts": uts,
//         "uas": uas,
//         "nis": nis,
//     };
// }

// class Meta {
//     Meta();

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//     );

//     Map<String, dynamic> toJson() => {
//     };
// }
