// To parse this JSON data, do
//
//     final scale = scaleFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:scales_app/models/Note.dart';

import 'Note.dart';

Scale scaleFromJson(String str) => Scale.fromMap(json.decode(str));

String scaleToJson(Scale data) => json.encode(data.toMap());

class Scale {
  final String root;
  final String type;
  final List<String> notes;
  final List<Note> playableNotes;

  Scale({
    @required this.root,
    @required this.type,
    @required this.notes,
    @required this.playableNotes,
  });

  factory Scale.fromMap(Map<String, dynamic> json) => Scale(
      root: json["root"] == null ? null : json["root"],
      type: json["type"] == null ? null : json["type"],
      notes: json["notes"] == null ? null : List<String>.from(json["notes"].map((x) => x)),
      playableNotes: json["playable_notes"] == null ? null : List<Note>.from(json["playable_notes"].map((x) => Note.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "root": root == null ? null : root,
    "type": type == null ? null : type,
    "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
    "playable_notes": playableNotes == null ? null : List<dynamic>.from(playableNotes.map((x) => x.toMap())),
  };

  @override
  String toString() {
    return '$root $type';
  }


}