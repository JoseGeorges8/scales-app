// To parse this JSON data, do
//
//     final scale = scaleFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Scale scaleFromJson(String str) => Scale.fromMap(json.decode(str));

String scaleToJson(Scale data) => json.encode(data.toMap());

class Scale {
  String root;
  String type;
  List<String> notes;

  Scale({
    @required this.root,
    @required this.type,
    @required this.notes,
  });

  factory Scale.fromMap(Map<String, dynamic> json) => Scale(
      root: json["root"] == null ? null : json["root"],
      type: json["type"] == null ? null : json["type"],
      notes: json["notes"] == null ? null : List<String>.from(json["notes"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "root": root == null ? null : root,
    "type": type == null ? null : type,
    "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
  };

  @override
  String toString() {
    return '$root $type';
  }


}