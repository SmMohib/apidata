
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        required this.nama,
        required this.avatar,
        required this.alamat,
        required this.email,
        required this.pekerjaan,
        required this.quote,
        required this.id,
    });

    String nama;
    String avatar;
    String alamat;
    String email;
    String pekerjaan;
    String quote;
    String id;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        nama: json["nama"],
        avatar: json["avatar"],
        alamat: json["alamat"],
        email: json["email"],
        pekerjaan: json["pekerjaan"],
        quote: json["quote"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "avatar": avatar,
        "alamat": alamat,
        "email": email,
        "pekerjaan": pekerjaan,
        "quote": quote,
        "id": id,
    };
}
