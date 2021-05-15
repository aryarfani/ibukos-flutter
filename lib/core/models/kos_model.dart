import 'dart:convert';

List<KosModel> kosModelFromJson(String str) => List<KosModel>.from(json.decode(str).map((x) => KosModel.fromJson(x)));

String kosModelToJson(List<KosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KosModel {
  KosModel({
    this.nama,
    this.telp,
    this.biaya,
    this.deskripsi,
    this.alamat,
    this.gambar,
    this.createdAt,
  });

  String nama;
  String telp;
  String biaya;
  String deskripsi;
  String alamat;
  String gambar;
  DateTime createdAt;

  factory KosModel.fromJson(Map<String, dynamic> json) => KosModel(
        nama: json["nama"],
        telp: json["telp"],
        biaya: json["biaya"],
        deskripsi: json["deskripsi"],
        alamat: json["alamat"],
        gambar: json["gambar"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "telp": telp,
        "biaya": biaya,
        "deskripsi": deskripsi,
        "alamat": alamat,
        "gambar": gambar,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
