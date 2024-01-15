// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Contact welcomeFromJson(String str) => Contact.fromJson(json.decode(str));

String welcomeToJson(Contact data) => json.encode(data.toJson());

class Contact {
  String id;
  String name;
  String number;

  Contact({
    required this.id,
    required this.name,
    required this.number,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["Name"] ?? " ",
        number: json["Number"]?? " ",
        id: json["id"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Number": number,
      };
}
