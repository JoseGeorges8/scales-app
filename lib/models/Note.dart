// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

Note noteFromJson(String str) => Note.fromMap(json.decode(str));

String noteToJson(Note data) => json.encode(data.toMap());

// ignore: must_be_immutable
class Note extends Equatable{
  final String value;
  final bool isSharp;
  final int midi;
  bool isSelected;

  Note({
    @required this.value,
    @required this.isSharp,
    @required this.midi,
    this.isSelected = false,
  });

  factory Note.C() => Note(value: 'C', isSharp: false, midi: 60);
  factory Note.dFlat() => Note(value: 'D♭', isSharp: true, midi: 61);
  factory Note.D() => Note(value: 'D', isSharp: false, midi: 62);
  factory Note.eFlat() => Note(value: 'E♭', isSharp: true, midi: 63);
  factory Note.E() => Note(value: 'E', isSharp: false, midi: 64);
  factory Note.F() => Note(value: 'F', isSharp: false, midi: 65);
  factory Note.gFlat() => Note(value: 'G♭', isSharp: true, midi: 66);
  factory Note.G() => Note(value: 'G', isSharp: false, midi: 67);
  factory Note.aFlat() => Note(value: 'A♭', isSharp: true, midi: 68);
  factory Note.A() => Note(value: 'A', isSharp: false, midi: 69);
  factory Note.bFlat() => Note(value: 'B♭', isSharp: true, midi: 70);
  factory Note.B() => Note(value: 'B', isSharp: false, midi: 71);

  Note copyWith({
    String value,
    bool isSelected,
    bool isSharp,
    int midi
  }) =>
      Note(
        value: value ?? this.value,
        isSelected: isSelected ?? this.isSelected,
        isSharp: isSharp ?? this.isSharp,
        midi: midi ?? this.midi,
      );

  factory Note.fromMap(Map<String, dynamic> json) => Note(
    value: json["value"],
    isSelected: json["is_selected"],
    isSharp: json["is_sharp"],
    midi: json["midi"],
  );

  Map<String, dynamic> toMap() => {
    "value": value,
    "is_selected": isSelected,
    "is_sharp": isSharp,
    "midi": midi,
  };


  @override
  String toString() {
    return '{ $value|$isSelected }';
  }

  @override
  List<Object> get props => [value, isSelected, isSharp, midi];
}