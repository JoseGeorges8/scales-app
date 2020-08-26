// To parse this JSON data, do
//
//     final scale = scaleFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/models/Note.dart';

import 'Note.dart';

Scale scaleFromJson(String str) => Scale.fromMap(json.decode(str));

String scaleToJson(Scale data) => json.encode(data.toMap());

class Scale extends Equatable {
  final String root;
  final String type;
  final List<String> notes;
  final List<Note> playableNotes;
  bool isSelected;

  Scale({
    @required this.root,
    @required this.type,
    @required this.notes,
    @required this.playableNotes,
    this.isSelected = false
  });

  factory Scale.copyWith({root,
    type,
    notes,
    playableNotes,
    isSelected = false
  }) => Scale(root: root, type: type, notes: notes, playableNotes: playableNotes, isSelected: isSelected);

  factory Scale.fromMap(Map<String, dynamic> json) => Scale(
      root: json["root"] == null ? null : json["root"],
      type: json["type"] == null ? null : json["type"],
      notes: json["notes"] == null ? null : List<String>.from(json["notes"].map((x) => x)),
      isSelected: json["selected"] == null ? false : json["selected"],
      playableNotes: json["playable_notes"] == null ? null : List<Note>.from(json["playable_notes"].map((x) => Note.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "root": root == null ? null : root,
    "type": type == null ? null : type,
    "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
    "playable_notes": playableNotes == null ? null : List<dynamic>.from(playableNotes.map((x) => x.toMap())),
    "selected": isSelected == null ? false : isSelected,
  };

  @override
  String toString() {
    return '$root $type';
  }

  @override
  List<Object> get props => [root, type, notes, playableNotes, isSelected];


}