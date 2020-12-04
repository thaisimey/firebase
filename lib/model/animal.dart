// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


Animal welcomeFromJson(String str) => Animal.fromJson(json.decode(str));
String welcomeToJson(Animal data) => json.encode(data.toJson());

class Animal {
  Animal({
    this.id,
    this.name,
    this.photo,
    this.gender,
    this.username,
    this.password,
  });

  String id;
  String name;
  String photo;
  String gender;
  String username;
  String password;

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    gender: json["gender"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
    "gender": gender,
    "username": username,
    "password": password,
  };
}
