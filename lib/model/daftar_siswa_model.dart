// import 'dart:convert';

// DaftarSiswaModel daftarSiswaModelFromJson(Map<String, dynamic> str) =>
//     DaftarSiswaModel.fromJson(str);

// String daftarSiswaModelToJson(DaftarSiswaModel data) =>
//     json.encode(data.toJson());

// class DaftarSiswaModel {
//   List<Datum> data;
//   Meta meta;

//   DaftarSiswaModel({
//     required this.data,
//     required this.meta,
//   });

//   factory DaftarSiswaModel.fromJson(Map<String, dynamic> json) =>
//       DaftarSiswaModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//       };
// }

// class Datum {
//   int id;
//   DatumAttributes attributes;

//   Datum({
//     required this.id,
//     required this.attributes,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         attributes: DatumAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class DatumAttributes {
//   String namaSiswa;
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime publishedAt;
//   int? ulanganHarian1;
//   int? ulanganHarian2;
//   int? ulanganHarian3;
//   String fotoProfile;
//   int? uts;
//   int? uas;
//   String? nis;
//   Class attributesClass;

//   DatumAttributes({
//     required this.namaSiswa,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.ulanganHarian1,
//     required this.ulanganHarian2,
//     required this.ulanganHarian3,
//     required this.fotoProfile,
//     required this.uts,
//     required this.uas,
//     required this.nis,
//     required this.attributesClass,
//   });

//   factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
//       DatumAttributes(
//         namaSiswa: json["nama_siswa"] ?? "pppp",
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         ulanganHarian1: json["ulangan_harian_1"] ?? 0,
//         ulanganHarian2: json["ulangan_harian_2"] ?? 0,
//         ulanganHarian3: json["ulangan_harian_3"] ?? 0,
//         fotoProfile: json["foto_profile"] ??
//             "https://assets-a1.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png?t=o&v=1200",
//         uts: json["uts"] ?? 0,
//         uas: json["uas"] ?? 0,
//         nis: json["nis"],
//         attributesClass: Class.fromJson(json["class"]),
//       );

//   Map<String, dynamic> toJson() => {
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
//         "class": attributesClass.toJson(),
//       };
// }

// class Class {
//   Data? data;

//   Class({
//     required this.data,
//   });

//   factory Class.fromJson(Map<String, dynamic> json) => Class(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//       };
// }

// class Data {
//   int id;
//   DataAttributes attributes;

//   Data({
//     required this.id,
//     required this.attributes,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         attributes: DataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class DataAttributes {
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime publishedAt;
//   String namaKelas;

//   DataAttributes({
//     required this.createdAt,
//     required this.updatedAt,
//     required this.publishedAt,
//     required this.namaKelas,
//   });

//   factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         namaKelas: json["nama_kelas"],
//       );

//   Map<String, dynamic> toJson() => {
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "publishedAt": publishedAt.toIso8601String(),
//         "nama_kelas": namaKelas,
//       };
// }

// class Meta {
//   Pagination pagination;

//   Meta({
//     required this.pagination,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         pagination: Pagination.fromJson(json["pagination"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "pagination": pagination.toJson(),
//       };
// }

// class Pagination {
//   int page;
//   int pageSize;
//   int pageCount;
//   int total;

//   Pagination({
//     required this.page,
//     required this.pageSize,
//     required this.pageCount,
//     required this.total,
//   });

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         page: json["page"],
//         pageSize: json["pageSize"],
//         pageCount: json["pageCount"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "page": page,
//         "pageSize": pageSize,
//         "pageCount": pageCount,
//         "total": total,
//       };
// }
// To parse this JSON data, do
//
//     final daftarSiswaModel = daftarSiswaModelFromJson(jsonString);

import 'dart:convert';

DaftarSiswaModel daftarSiswaModelFromJson(Map<String, dynamic> str) => DaftarSiswaModel.fromJson((str));

String daftarSiswaModelToJson(DaftarSiswaModel data) => json.encode(data.toJson());

class DaftarSiswaModel {
    List<Datum> data;
    Meta meta;

    DaftarSiswaModel({
        required this.data,
        required this.meta,
    });

    factory DaftarSiswaModel.fromJson(Map<String, dynamic> json) => DaftarSiswaModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Datum {
    int id;
    Attributes attributes;

    Datum({
        required this.id,
        required this.attributes,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    String namaSiswa;
    int ulanganHarian1;
    int ulanganHarian2;
    int ulanganHarian3;
    int uts;
    int uas;
    String fotoProfile;

    Attributes({
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.namaSiswa,
        required this.ulanganHarian1,
        required this.ulanganHarian2,
        required this.ulanganHarian3,
        required this.uts,
        required this.uas,
        required this.fotoProfile,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        namaSiswa: json["nama_siswa"],
        ulanganHarian1: json["ulangan_harian_1"] ?? 0,
        ulanganHarian2: json["ulangan_harian_2"] ?? 0,
        ulanganHarian3: json["ulangan_harian_3"] ?? 0,
        uts: json["uts"] ?? 0,
        uas: json["uas"] ?? 0,
        fotoProfile: json["foto_profile"] ?? "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.its.ac.id%2Fit%2Fwp-content%2Fuploads%2Fsites%2F46%2F2021%2F06%2Fblank-profile-picture-973460_1280.png&tbnid=ppsZBg_LY8zSmM&vet=12ahUKEwjOlbCNp56CAxXVoOkKHXeoCD4QMygAegQIARBn..i&imgrefurl=https%3A%2F%2Fwww.its.ac.id%2Fit%2Fid%2Fdaftar-dosen%2Fblank-profile-picture-973460_1280%2F&docid=Ge7YBXEe8CpB3M&w=1280&h=1280&q=profile&ved=2ahUKEwjOlbCNp56CAxXVoOkKHXeoCD4QMygAegQIARBn",
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "nama_siswa": namaSiswa,
        "ulangan_harian_1": ulanganHarian1,
        "ulangan_harian_2": ulanganHarian2,
        "ulangan_harian_3": ulanganHarian3,
        "uts": uts,
        "uas": uas,
        "foto_profile": fotoProfile,
    };
}

class Meta {
    Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    int page;
    int pageSize;
    int pageCount;
    int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
