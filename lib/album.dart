import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.name,
  });

  String name;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
